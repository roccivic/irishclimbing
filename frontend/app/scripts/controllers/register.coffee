'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:RegisterCtrl
 # @description
 # # RegisterCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'RegisterCtrl', ($scope, $http, serverUrl) ->
    $scope.categories = [
        'Male A'
        'Male B'
        'Female A'
        'Female B'
    ]

    $scope.grades = [
        '4+', '5+', '6+', '7+'
    ]

    ResetForm = ->
        $scope.college = ''
        $scope.name = ''
        $scope.email = ''
        $scope.category = $scope.categories[0]
        $scope.grade = $scope.grades[0]

    FormData = ->
        {
            college: $scope.college
            name: $scope.name
            email: $scope.email
            category: $scope.category
            grade: $scope.grade
        }

    $scope.submit = ->
        $scope.loading = true
        $scope.error = false
        $scope.error = false
        $http.post(
            serverUrl + 'register.php',
            FormData()
        )
        .success ->
            $scope.loading = false
            $scope.success = true
            ResetForm()
        .error (error_text) ->
            $scope.loading = false
            $scope.error = true
            $scope.error_text = error_text

    ResetForm()