'use strict';

module.exports = function(config) {
  config.set({
    basePath: '../..',
    frameworks: ['jasmine'],

    files: ['javascripts/*.js'],

    exclude: [
    ],

    preprocessors: {
    },

    reporters: ['progress'],
    port: 9876,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    plugins : [
      'karma-phantomjs-launcher',
      'karma-jasmine'
    ],
    browsers: ['PhantomJS'],
    singleRun: false
  })
};
