'use strict';

angular.module('nameApp')
  .factory 'utils', [ '$timeout', ($timeout) ->
    {
      randomer: ->
        Math.floor(Math.random() * 9000000) + 10000

      timer: (limit, url) ->
          limit--
          if limit > 0
            $timeout timer, 1000
          if limit is 0
            $window.location.href = "/#/#{url}"

      shuffi: (arr) ->
        i = arr.length
        while --i > 0
            j = ~~(Math.random() * (i + 1))
            t = arr[j]
            arr[j] = arr[i]
            arr[i] = t
        angular.copy arr # dat dare deep copy
    }
  ]
