'use strict';

module.exports = function(config) {
	// Karma configuration
  config.set({
    basePath: '.',
    frameworks: ['jasmine'],
    files: [
    	'public/dist/*.js'
    ],
    exclude: [],
    colors: true,
    port: 9876,
    // Level of logging
    // possible values: [
    //   config.LOG_DISABLE
    //   config.LOG_ERROR
    //   config.LOG_WARN
    //   config.LOG_INFO
    //   config.LOG_DEBUG
    // ]
    logLevel: config.LOG_INFO,
    // Test results reporter to use
    // possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['progress'],
    preprocessors: {
      // source files that you want to generate coverage for
      // do not include tests or libraries
      'public/app/controllers/*.js': ['coverage'],
      'public/app/services/*.js': ['coverage']
    },
    coverageReporter: {
      type: 'html',
      dir: 'test/coverage/'
    },
    autoWatch: true,
    browsers: ['PhantomJS'],
    // If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000,
    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: true
  });

};