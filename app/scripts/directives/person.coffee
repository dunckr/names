'use strict';

angular.module('nameApp')
  .directive 'guess', ->
    {
      restrict: 'E'
      templateUrl: 'views/guess.html'
      scope: true
      controller: 'ResultsCtrl'
    }
