'use strict';

module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-karma');
  grunt.registerTask('default', ['karma']);

  grunt.initConfig({
    karma: {
      unit: {
        configFile: 'spec/karma/config/karma.conf.js'
      }
    }
  });
};
