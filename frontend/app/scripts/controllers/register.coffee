'use strict'

###*
 # @ngdoc function
 # @name irishclimbingApp.controller:RegisterCtrl
 # @description
 # # RegisterCtrl
 # Controller of the irishclimbingApp
###
angular.module('irishclimbingApp')
  .controller 'RegisterCtrl', ($scope) ->
    $scope.categories = [
        'Male A'
        'Male B'
        'Female A'
        'Female B'
    ]
    $scope.grades = [
        '4+' , '5+', '6+', '7+'
    ]
    $scope.college = ''
    $scope.name = ''
    $scope.category = $scope.categories[0]
    $scope.grade = $scope.grades[0]