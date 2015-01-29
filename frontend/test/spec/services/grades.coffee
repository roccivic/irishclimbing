'use strict'

describe 'Service: grades', ->

  # load the service's module
  beforeEach module 'irishclimbingApp'

  # instantiate service
  grades = {}
  beforeEach inject (_grades_) ->
    grades = _grades_

  it 'should do something', ->
    expect(!!grades).toBe true
