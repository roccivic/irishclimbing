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
        $scope.competitor = competitor
        $scope.title = "Create competitor"
    else
        $scope.competitor = competitor
        $scope.title = "Edit competitor"

    $scope.close = ->
        $modalInstance.dismiss('cancel')

    $scope.submit = ->
        alert 'Not implemented'