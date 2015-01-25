'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:SponsorsCtrl
 # @description
 # # SponsorsCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'SponsorsCtrl', ($scope, $http, serverUrl) ->
    $scope.loading = true
    $http.get(serverUrl + 'sponsors.php')
    .success (sponsors) ->
        $scope.loading = false
        $scope.sponsors = sponsors
    .error ->
        $scope.loading = false
        $scope.error = true