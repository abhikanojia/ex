# class Array
#   def count
#     count = 0
#     each { |i| count += 1 }
#   end
# end
# a = (1..10).to_a
# print a.count

# module C
#   @test = []
#   def self.test_meth
#     @test
#   end
# end


# class A
#   include C
#   attr_accessor :name

#   def test_val
#     @@test << self
#   end
# end

# class B < A
#   def self.valu
#     @@test
#   end
# end

module A
  module C
    def method_name
      p @list
    end

    def validate_presence(*arg)
      puts "validate_presence"
      p @list
    end
  end

  def self.included(class_name)
    class_name.extend C
    class_name.class_eval do
      @list = []
    end
  end
end

class D
  include A
end

class Play
  include A
end


# pl = Play.new
# Play.method_name


class F
  attr_accessor :fname
  include A

  validate_presence :fname

  def meth
    # self.class.test_meth(self)
    puts "method_name"
  end

  def self.test_meth(var)
    # p @list << var
    meth()
  end
end

f = F.new

# f.fname = "Abhishek"
p F.test_meth("Asd")
# f.method_name

# f.instance_eval do
#   def fname_defined?
#     @fname || false
#   end
# end

# p f.fname_defined?

# p B.valu
# a = A.new
# a.name = "Asdasd"
# p a.instance_variable_defined?("@name")
# a.test_val
# p a.test_meth