gulp           = require 'gulp'
colors         = require 'colors/safe'
mocha          = require 'gulp-mocha'
nodemon        = require 'nodemon'

gulp.task 'test-mocha', =>
  gulp.src ['test/**/*.coffee', '!test/coverage/**']
    .pipe mocha
      require: 'test/test_helper.coffee'
      reporter: 'spec'
    .on 'error', (error) => console.error error

gulp.task 'test', ['test-mocha']

gulp.task 'nodemon', ['bower:concat', 'scripts:concat'], =>
  nodemon
    script: 'server'
    ext: 'js coffee'
    watch: [
      'app/**/*'
      'lib/*'
      'server.*'
    ]
  .on 'restart', => console.log colors.grey 'The Matrix is reloading...'

gulp.task 'watch', ['nodemon']

gulp.task 'default', []

gulp.task 'production', ['test']
