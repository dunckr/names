'use strict'

angular.module('nameApp', [])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
      .when '/difficulty/:difficulty',
        templateUrl: 'views/display.html'
        controller: 'DisplayCtrl'
      .when '/results',
        templateUrl: 'views/results.html'
        controller: 'ResultsCtrl'  
      .when '/match',
        templateUrl: 'views/match.html'
        controller: 'MatchCtrl'    
      .otherwise
        redirectTo: '/'
  ]
