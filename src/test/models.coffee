module "models"

test "truthiness", ->
  strictEqual 'hello', 'hello'
  
test "falsiness", ->
  strictEqual 'hello', 'world'
