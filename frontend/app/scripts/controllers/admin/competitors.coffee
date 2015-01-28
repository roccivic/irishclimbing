'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminCompetitorsCtrl
 # @description
 # # AdminCompetitorsCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminCompetitorsCtrl', ($scope, $http, $location, serverUrl) ->
    $scope.deleting = {}
    $scope.loading = true
    $scope.categories = [
        'Any'
        'Male A'
        'Male B'
        'Female A'
        'Female B'
    ]

    $scope.grades = [
        'Any', 'Don\'t know', '4+', '5+', '6+', '7+'
    ]
    $scope.category = $scope.categories[0]
    $scope.grade = $scope.grades[0]
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
