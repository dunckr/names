'use strict';

angular.module('nameApp')
  .factory 'people', [ '$http', '$q', 'utils', ($http, $q, utils) ->

    people = []
    selections = []
    difficulty = 'easy'

    getPerson = ->
      deferred = $q.defer()
      $http
        .get('https://graph.facebook.com/' + utils.randomer() + '/?fields=picture,name')
        .success (data) ->
          deferred.resolve data
        .error (data) ->
          failure data
      deferred.promise

    success = (data) ->
      if data.picture.data.is_silhouette
        # try again...
        promise = getPerson()
        promise.then success
      else 
        people.push
              name:   data.name
              id:     data.id
              pic:    'https://graph.facebook.com/' + data.id + '/picture/?type=large'

    failure = (data) ->
      promise = getPerson()
      promise.then success
    {
      init: (number) ->
        people = []
        selections = []
        difficulty = 'easy'
        for num in [0..number]
          promise = getPerson()
          promise.then success, failure
        people

      getPeople: ->
        people

      getDifficulty: ->
        difficulty

      setDifficulty: (d) ->
        difficulty = d

      getSelections: ->
        selections

      setSelections: (s) ->
        selections = s

    }
  ]
