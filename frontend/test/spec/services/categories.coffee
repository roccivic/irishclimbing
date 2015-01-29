'use strict'

describe 'Service: categories', ->

  # load the service's module
  beforeEach module 'irishclimbingApp'

  # instantiate service
  categories = {}
  beforeEach inject (_categories_) ->
    categories = _categories_

  it 'should do something', ->
    expect(!!categories).toBe true
