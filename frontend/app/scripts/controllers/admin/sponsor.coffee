'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminSponsorCtrl
 # @description
 # # AdminSponsorCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminSponsorCtrl', ($scope, $http, $modalInstance, serverUrl, sponsor) ->
    $scope.sponsor = sponsor
    $scope.title = "Edit sponsor"
    if sponsor == null
        $scope.title = "Create sponsor"
    $scope.close = ->
        $modalInstance.dismiss('cancel')
    $scope.submit = ->
        alert 'Not implemented'