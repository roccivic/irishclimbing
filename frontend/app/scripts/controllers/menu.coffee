'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:MenuCtrl
 # @description
 # # MenuCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'MenuCtrl', ($scope, $location) ->
    $scope.isActive = (viewLocation) ->
        '/' + viewLocation == $location.path()