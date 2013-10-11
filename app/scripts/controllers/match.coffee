'use strict'

angular.module('nameApp')
  .controller 'MatchCtrl', ['$scope', '$timeout', '$window', 'people', 'utils', ($scope, $timeout, $window, people, utils) ->

    $scope.difficulty = people.getDifficulty()
    if $scope.difficulty is 'easy'
      secs = 20
    else
      secs = 20
    $scope.time = secs

    $scope.people = people.getPeople()
    $scope.people = utils.shuffi $scope.people

    selections = []
    list = []
    list.push p.name for p in $scope.people

    for person in $scope.people
      selections.push
        name: person.name
        id: person.id
        pic: person.pic
        answer: null
        options: utils.shuffi list

    $scope.selections = selections
    people.setSelections selections

    timer = ->
        $scope.time--
        if $scope.time > 0
          $timeout timer, 1000
        if $scope.time is 0
          $window.location.href = '/#/results'
    timer()
  ]
