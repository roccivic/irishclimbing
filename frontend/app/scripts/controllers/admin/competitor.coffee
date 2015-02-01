'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminCompetitorCtrl
 # @description
 # # AdminCompetitorCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminCompetitorCtrl', ($scope, $http, $modalInstance, serverUrl, competitor, categories, grades) ->

    $scope.categories = categories
    $scope.grades = grades

    if competitor == null
        $scope.competitor = {}
        $scope.title = "Create competitor"
    else
        $scope.editing = true
        $scope.competitor = competitor
        $scope.title = "Edit competitor"

    $scope.close = ->
        $modalInstance.dismiss('cancel')

    $scope.submit = ->
        $scope.loading = true
        $scope.error = null
        if competitor == null
            method = "PUT"
            url = serverUrl + 'competitor.php'
        else
            method = "PATCH"
            url = serverUrl + 'competitor.php/' + competitor.id
        $http(
            url: url
            data: $scope.competitor
            method: method
        )
        .success ->
            $modalInstance.close $scope.competitor
        .error ->
            $scope.loading = false
            if competitor == null
                $scope.error = 'Error creating competitor'
            else
                $scope.error = 'Error editing competitor'