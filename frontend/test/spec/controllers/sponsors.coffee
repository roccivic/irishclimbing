'use strict'

describe 'Controller: SponsorsCtrl', ->

  # load the controller's module
  beforeEach module 'irishclimbingApp'

  SponsorsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SponsorsCtrl = $controller 'SponsorsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
