'use strict'

describe 'Controller: AdminCompetitorsCtrl', ->

  # load the controller's module
  beforeEach module 'irishclimbingApp'

  AdminCompetitorsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdminCompetitorsCtrl = $controller 'AdminCompetitorsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
