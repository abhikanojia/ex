def test(a, b, c, d=1)
  puts a
end

p method(:test).parameters
p method(:test).arity
p