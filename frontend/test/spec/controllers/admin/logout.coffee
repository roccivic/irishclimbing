'use strict'

describe 'Controller: AdminLogoutCtrl', ->

  # load the controller's module
  beforeEach module 'irishclimbingApp'

  AdminLogoutCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdminLogoutCtrl = $controller 'AdminLogoutCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
