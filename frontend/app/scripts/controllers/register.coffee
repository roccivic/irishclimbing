'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:RegisterCtrl
 # @description
 # # RegisterCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'RegisterCtrl', ($scope, $http, $window, $timeout, grades, categories, serverUrl) ->
    $scope.categories = categories
    $scope.grades = grades

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
        $http.put(
            serverUrl + 'competitor.php',
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
            $scope.error_text = data.message || data.error_string || "An error has occurred while processing your request"
            $timeout ->
                $window.scrollTo 0, 0
            , 4

    ResetForm()