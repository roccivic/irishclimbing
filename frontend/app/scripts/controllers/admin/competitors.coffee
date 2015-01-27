'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:AdminCompetitorsCtrl
 # @description
 # # AdminCompetitorsCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'AdminCompetitorsCtrl', ($scope, $http, serverUrl) ->
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
    $scope.loading = true
    $http.post(serverUrl + 'competitor.php')
    .success (data) ->
        $scope.loading = false
        $scope.competitors = data
    .error ->
        $scope.loading = false
        $location.path '/'