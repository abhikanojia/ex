module Foo
  def test
    "test module"
  end
end

class A
  def initialize(name)
    @name = name
  end
end

ob = A.new("Abhishek")
puts ob.object_id

s = ob.extend(Foo)
puts s.object_id

# puts ob.object_id

# ob2 = ob.dup
# # puts ob2.object_id
# puts ob2.test

# ob3 = ob.clone

# puts ob3.test
