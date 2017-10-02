# class Module
#   @@count = 0
#   def included(name)
#     # puts "#{self} included in #{name}"
#     @@count += 1
#   end
# end
#
# class SomeClass
#   include Comparable
#   # def <=>(other)
#   #   puts "Comparing.."
#   #   0
#   # end
# end
# p Module.count
# s = SomeClass.new
# s < 123
class Parent
  def self.inherited(klass)
    puts "#{klass}"
  end
end

class Child < Parent
end

class OtherChild < Parent
end
