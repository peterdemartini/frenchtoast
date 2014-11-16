'use strict';

var gulp = require('gulp');

// Require Gulp Plugins
var jshint  = require('gulp-jshint');
var concat  = require('gulp-concat');
var uglify  = require('gulp-uglify');
var rename  = require('gulp-rename');
var nodemon = require('nodemon');
var karma   = require('gulp-karma');
var mocha   = require('gulp-mocha');

// Lint Task
gulp.task('lint', function() {
  return gulp.src('*.js')
    .pipe(jshint())
    .pipe(jshint.reporter('default'));
});

// Concatenate & Minify JS
gulp.task('scripts', function() {
  return gulp.src(['public/app/*.js', 'public/app/**/*.js'])
    .pipe(concat('app.js'))
    .pipe(gulp.dest('public/dist'))
    .pipe(rename('app.min.js'))
    .pipe(uglify())
    .pipe(gulp.dest('public/dist'));
});

// Watch for changes and reboot if needed
gulp.task('watch', function() {
  return nodemon({
    script: 'server',
    ext: 'html js',
    watch : [
      'app/**/*.js',
      'lib/*.js',
      'server.js'
    ]
  }).on('restart', function() {
    console.log('The Matrix is reloading.');
  });
});

// Test Frontend
gulp.task('test-karma', function() {
  return gulp.src([
      'public/test/**/*.js'
    ])
    .pipe(karma({
      configFile: 'karma.conf.js'
    }))
    .on('error', function(err){
      console.error(err.stack);
    });
});

// Test Backend
gulp.task('test-mocha', function() {
  return gulp.src(['test/**/*.js', '!test/coverage/**'])
    .pipe(mocha({
      require: 'server.js'
    }))
    .on('error', function(err){
      console.error(err.stack);
    });
});

// Test Task
gulp.task('test', ['test-mocha', 'test-karma']);

// Default Task
gulp.task('default', ['lint', 'scripts', 'watch']);
