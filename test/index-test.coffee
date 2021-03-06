parser = require '../'
vows = require 'vows'
assert = require 'assert'

test = vows.describe 'parser'
test.addBatch {
  'when parsing code':
    topic: ->
      code = '(function () { var fn = function() { return 1; }; function foo() { return 2; } })'
      parser code

    'returns 1 when calling fn': (r) -> assert.equal r.fn(), 1
    'returns 2 when calling foo': (r) -> assert.equal r.foo(), 2
}
test.addBatch {
  'no anon functions':
    topic: ->
      code = '(function() { }());'
      parser code

    'should contain no functions': (r) -> assert.equal Object.keys(r), 0
}

test.export module
