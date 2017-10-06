# class A
#   def initialize

#   end

#   def test_method
#     "test method : not in singleton class"
#   end

# 	class << self
# 		def test_method
# 			"test from singleton class"
# 		end
#     class << self
#       def test_method
#         "method from singleton class's singleton class"
#       end
#     end
#   end
# end

# p A.singleton_class.test_method

class D
  class << self
    attr_accessor :d
    def d_test
      "d from #{self}"
    end
  end
end


class C < D
end

p D.d_test
p C.d_test

p D.singleton_class
p D.singleton_class.instance_methods(false)


d = D.new
p d.singleton_class
class << d
  def d_sing
    "method"
  end
end

p d.singleton_class.instance_methods(false)