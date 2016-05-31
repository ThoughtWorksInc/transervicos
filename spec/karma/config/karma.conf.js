'use strict';

module.exports = function(config) {
  config.set({
    basePath: '../../',
    frameworks: ['jasmine'],

    files: [
      '../app/assets/javascripts/registrations.js',
      'javascripts/*.js'
    ],
    exclude: [
    ],

    preprocessors: {
    },

    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    plugins : [
      'karma-phantomjs-launcher',
      'karma-jasmine'
    ],
    browsers: ['PhantomJS'],
    singleRun: true
  })
};
