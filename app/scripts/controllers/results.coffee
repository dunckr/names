'use strict'

angular.module('nameApp')
  .controller 'ResultsCtrl', ['$scope', 'people', ($scope, people) ->

    selections = people.getSelections()

    result = 0
    count = 0
    for choice in selections
      count++ if choice.name is choice.answer
    result = (count / selections.length * 100).toFixed 2
    console.log count

    $scope.grade = switch
      when result > 95 then 'A+'
      when result > 90 then 'A'
      when result > 80 then 'B'
      when result > 70 then 'C'
      when result > 60 then 'D'
      when result > 50 then 'E'
      when result > 40 then 'F'
      when result > 30 then 'FAIL'
    $scope.result = "#{result}%"
    $scope.difficulty = people.getDifficulty()

  ]
