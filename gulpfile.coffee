'use strict';

gulp = require 'gulp'

bower          = require 'gulp-bower'
mainBowerFiles = require 'main-bower-files'
concat         = require 'gulp-concat'
coffee         = require 'gulp-coffee'
colors         = require 'colors/safe'
karma          = require 'gulp-karma'
mocha          = require 'gulp-mocha'
nodemon        = require 'nodemon'
plumber        = require 'gulp-plumber'
rename         = require 'gulp-rename'
sourcemaps     = require 'gulp-sourcemaps'
template       = require 'gulp-template'
uglify         = require 'gulp-uglify'

gulp.task 'bower', =>
  bower()
    .pipe gulp.dest 'public/lib/'

gulp.task 'bower:concat', ['bower'], =>
  gulp.src mainBowerFiles(filter: /\.js$/)
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe concat('dependencies.js')
    .pipe sourcemaps.write('.')
    .pipe gulp.dest('public/dist')

gulp.task 'config:site', =>
  app = require('./config').app
  appString = JSON.stringify app, null, 2
  gulp.src ['public/config/app.coffee']
    .pipe template(config: appString)
    .pipe coffee(bare: true)
    .pipe concat('config.js')
    .pipe gulp.dest('public/dist')

gulp.task 'scripts:concat', ['bower:concat', 'config:site'], =>
  gulp.src ['public/app/**/*.coffee']
    .pipe coffee(bare: true)
    .pipe concat('app.js')
    .pipe gulp.dest('public/dist')
    .pipe rename('app.min.js')
    .pipe uglify()
    .pipe gulp.dest 'public/dist'

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

gulp.task 'nodemon', ['bower:concat', 'scripts:concat'], =>
  nodemon
    script: 'server'
    ext: 'html js coffee'
    watch: [
      'app/**/*'
      'lib/*'
      'server.*'
    ]
  .on 'restart', => console.log colors.grey 'The Matrix is reloading...'

gulp.task 'watch', ['nodemon'], =>
  gulp.watch ['bower.json'], ['bower']
  gulp.watch ['public/app/**/*.coffee'], ['scripts:concat']

gulp.task 'default', ['scripts:concat']

gulp.task 'production', ['test', 'scripts:concat']

