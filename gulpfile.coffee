'use strict';

gulp = require 'gulp'

concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
nodemon = require 'nodemon'
karma = require 'gulp-karma'
mocha = require 'gulp-mocha'
colors = require 'colors/safe'

gulp.task 'scripts', =>
  gulp.src ['public/app/*.js', 'public/app/**/*.js']
    .pipe concat('app.js')
    .pipe gulp.dest('public/dist')
    .pipe rename('app.min.js')
    .pipe uglify()
    .pipe gulp.dest 'public/dist'

gulp.task 'nodemon', =>
  nodemon
    script: 'server'
    ext: 'html js coffee'
    watch: [
      'app/**/*'
      'lib/*'
      'server.*'
    ]
  .on 'restart', => console.log colors.green 'The Matrix is reloading...'

gulp.task 'test-karma', =>
  gulp.src ['public/test/**/*']
    .pipe karma(configFile: 'karma.conf.js')
    .on 'error', (error) => console.error error

gulp.task 'test-mocha', =>
  gulp.src ['test/**/*.coffee', '!test/coverage/**']
    .pipe mocha
      require: 'test/test_helper.coffee'
      reporter: 'spec'
    .on 'error', (error) => console.error error

gulp.task 'test', ['test-mocha', 'test-karma']

gulp.task 'watch', ['scripts', 'nodemon']

gulp.task 'default', ['scripts']

gulp.task 'production', ['test-mocha', 'test-karma', 'scripts']
