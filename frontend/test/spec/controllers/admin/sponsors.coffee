'use strict'

describe 'Controller: AdminSponsorsCtrl', ->

  # load the controller's module
  beforeEach module 'irishclimbingApp'

  AdminSponsorsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdminSponsorsCtrl = $controller 'AdminSponsorsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
