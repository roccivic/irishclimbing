'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:RegisterCtrl
 # @description
 # # RegisterCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'RegisterCtrl', ($scope, $http, $window, $timeout, serverUrl) ->
    $scope.categories = [
        'Male A'
        'Male B'
        'Female A'
        'Female B'
    ]

    $scope.grades = [
        'Don\'t know', '4+', '5+', '6+', '7+'
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
            $timeout ->
                $window.scrollTo 0, 0
            , 4
        .error (data) ->
            $scope.loading = false
            $scope.error = true
            $scope.error_text = data.message || "An error has occurred while processing your request"
            $timeout ->
                $window.scrollTo 0, 0
            , 4

    ResetForm()