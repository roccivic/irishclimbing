'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminCompetitorsCtrl
 # @description
 # # AdminCompetitorsCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminCompetitorsCtrl', ($scope, $http, $location, $modal, serverUrl) ->
    $scope.deleting = {}
    $scope.loading = true
    $http.post(serverUrl + 'competitor.php')
    .success (data) ->
        $scope.loading = false
        $scope.competitors = data
    .error ->
        $scope.loading = false
        $location.path '/'

    $scope.delete = (id) ->
        $scope.deleting[id] = true
        $scope.success = null
        $scope.error = null
        $http.delete(serverUrl + 'competitor.php/' + id)
        .success ->
            $scope.deleting[id] = false
            for index, competitor of $scope.competitors
                if competitor.id == id
                    $scope.competitors.splice(index, 1)
            $scope.success = 'Successfully deleted competitor'
        .error ->
            $scope.deleting[id] = false
            $scope.error = 'Error deleting competitor'

    $scope.create = ->
        $scope.edit null

    $scope.edit = (competitor) ->
        modalInstance = $modal.open
            templateUrl: 'views/admin/competitor.html'
            controller: 'AdminCompetitorCtrl'
            resolve:
                competitor: ->
                    angular.copy competitor