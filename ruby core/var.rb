# class Test
#   def initialize
#     @var = 10
#   end
#
#   def show
#     "Instance method invoke from #{self}"
#   end
#
#   def to_s
#     "Test: #{@var}"
#   end
# end
#
# p Test.new.show

class Test
  def initialize
    @@count = 1
    @var = 1
  end

  def ins_method
    "asd"
  end

  def self.method
    ins_method()
  end
end

p Test.method
p Test.new.ins_method
