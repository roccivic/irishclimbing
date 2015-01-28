'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminLogoutCtrl
 # @description
 # # AdminLogoutCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminLogoutCtrl', ($scope, $http, $location, serverUrl) ->
    $http.get(serverUrl + 'logout.php')
    .success (data) ->
        $location.path '/'
    .error ->
        $location.path '/'