'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminSponsorsCtrl
 # @description
 # # AdminSponsorsCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminSponsorsCtrl', ($scope, $http, $location, $modal, serverUrl) ->
    $scope.deleting = {}
    $scope.loading = true
    $http.get(serverUrl + 'sponsors.php')
    .success (data) ->
        $scope.loading = false
        $scope.sponsors = data
    .error ->
        $scope.loading = false
        $location.path '/'

    $scope.delete = (id) ->
        if confirm 'Are you sure you want to delete this sponsor?'
            $scope.deleting[id] = true
            $scope.success = null
            $scope.error = null
            $http.delete(serverUrl + 'sponsors.php/' + id)
            .success ->
                $scope.deleting[id] = false
                for index, sponsor of $scope.sponsors
                    if sponsor.id == id
                        $scope.sponsors.splice(index, 1)
                $scope.success = 'Successfully deleted sponsor'
            .error ->
                $scope.deleting[id] = false
                $scope.error = 'Error deleting sponsor'

    $scope.create = ->
        $scope.edit null

    $scope.edit = (sponsor) ->
        modalInstance = $modal.open
            templateUrl: 'views/admin/sponsor.html'
            controller: 'AdminSponsorCtrl'
            keyboard: false
            backdrop: 'static'
            resolve:
                sponsor: ->
                    angular.copy sponsor
        .result.then (response) ->
            if response.id
                $scope.success = 'Successfully edited sponsor'
                for index, sponsor of $scope.sponsors
                    if sponsor.id == response.id
                        $scope.sponsors[index] = response
            else
                $scope.success = 'Successfully created sponsor'
                $scope.sponsors.push response