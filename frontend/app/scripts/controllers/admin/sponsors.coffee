'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminSponsorsCtrl
 # @description
 # # AdminSponsorsCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminSponsorsCtrl', ($scope, $http, serverUrl) ->
    $scope.loading = true
    $http.get(serverUrl + 'sponsors.php')
    .success (data) ->
        $scope.loading = false
        $scope.sponsors = data
    .error ->
        $scope.loading = false
        $location.path '/'