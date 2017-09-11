class Fred
  def initialize(p1, p2)
    @a, @b = p1, p2
  end
  def method_name
    
  end
end
fred = Fred.new('cat', 99)
fred.instance_variable_set(:@a, 'dog')   #=> "dog"
fred.instance_variable_set("@c", 'cat')   #=> "cat"
print fred.inspect


print fred.public_methods(false)       