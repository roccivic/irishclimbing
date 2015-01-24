'use strict'

describe 'Controller: ContactCtrl', ->

  # load the controller's module
  beforeEach module 'irishclimbingApp'

  ContactCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ContactCtrl = $controller 'ContactCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
