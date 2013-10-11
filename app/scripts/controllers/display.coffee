'use strict'

angular.module('nameApp')
  .controller 'DisplayCtrl', ['$scope', '$routeParams', '$timeout', '$window', 'people', 'utils', ($scope, $routeParams, $timeout, $window, people, utils) ->

    people.setDifficulty $routeParams.difficulty
    $scope.difficulty = people.getDifficulty()
    
    if $scope.difficulty is 'easy'
      secs = 20
      number = 5
    else
      secs = 20
      number = 5

    $scope.time = secs
    $scope.people = people.init number

    timer = ->
        $scope.time--
        if $scope.time > 0
          $timeout timer, 1000
        if $scope.time is 0
          $window.location.href = '/#/match'
    timer()
  ]
