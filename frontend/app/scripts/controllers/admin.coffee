'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminCtrl
 # @description
 # # AdminCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminCtrl', ($scope, $http, $location, serverUrl) ->
    $scope.submit = ->
        $scope.loading = true
        $scope.error = false
        data = password: $scope.password
        $http.post(serverUrl + 'login.php', data)
        .success ->
            $scope.loading = false
            $location.path 'admin/competitors'
        .error ->
            $scope.loading = false
            $location.path '/'