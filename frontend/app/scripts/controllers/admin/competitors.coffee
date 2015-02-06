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

    $scope.exportUrl = serverUrl + 'export.php'

    $scope.sortColumn = '-timestamp'
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
        if confirm 'Are you sure you want to delete this competitor?'
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
            keyboard: false
            backdrop: 'static'
            resolve:
                competitor: ->
                    angular.copy competitor
        .result.then (response) ->
            if response.id
                $scope.success = 'Successfully edited competitor'
                for index, competitor of $scope.competitors
                    if competitor.id == response.id
                        $scope.competitors[index] = response
            else
                response.timestamp = new Date().toISOString().slice(0, 19).replace('T', ' ')
                $scope.competitors.unshift response
                $scope.success = 'Successfully created competitor'

    $scope.sort = (column) ->
        if $scope.sortColumn == column
            $scope.sortColumn = '-' + column
        else
            $scope.sortColumn = column