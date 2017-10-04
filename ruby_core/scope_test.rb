# v1 = 1
# class MyClass
#   def my_method
#     p binding
#     v3 = 3
#     local_variables
#   end

#   def self.metho
#     p binding
#   end

#   local_variables
# end
# ob = MyClass.new

# p ob.my_method
# p local_variables
# MyClass.metho

my_var = "Success"
p binding
A = Class.new do
  puts "#{my_var}"
  p binding
  define_method(:method_name) do
    puts "#{my_var}"
    p binding
  end
end

A.new.method_name