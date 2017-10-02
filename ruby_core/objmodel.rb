# class MyClass
#   def initialize
#     @v = 1
#   end
#
#   def method
#     @var = 1
#   end
# end
#
# class MyClass
#   def test
#     @var = "here"
#   end
# end
#
# ob = MyClass.new
# p ob.instance_variables
# ob.method
# ob.test
# p ob.instance_variables
# p MyClass.instance_methods(false)

class A
  @@test = 1
end

class B < A
  def get_value
    @@test
  end
end

p A.class_variables
p B.new.get_value
