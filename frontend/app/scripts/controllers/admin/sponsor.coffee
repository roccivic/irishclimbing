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

    if sponsor == null
        $scope.sponsor = {}
        $scope.title = "Create sponsor"
    else
        $scope.sponsor = sponsor
        $scope.title = "Edit sponsor"

    $scope.close = ->
        $modalInstance.dismiss('cancel')

    $scope.submit = ->
        $scope.loading = true
        $scope.error = null
        if sponsor == null
            method = "POST"
            url = serverUrl + 'sponsors.php'
        else
            method = "PATCH"
            url = serverUrl + 'sponsors.php/' + sponsor.id
        $http(
            url: url
            data: $scope.sponsor
            method: method
        )
        .success ->
            $modalInstance.close $scope.sponsor
        .error ->
            $scope.loading = false
            if sponsor == null
                $scope.error = 'Error creating sponsor'
            else
                $scope.error = 'Error editing sponsor'