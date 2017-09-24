# Dynamic Class generator class
class DynamicClass
  def initialize(class_name)
    class_name.capitalize!
    @class_name = Class.new
    Object.const_set(class_name, @class_name)
  end

  def def_method(method_name, method_body)
    @class_name.class_eval do
      define_method(method_name) { instance_eval(method_body) }
    end
  end

  def call(method_name)
    @class_name.new.send(method_name)
  end
end

# take input from user

print 'Please enter the class name: '
class_name = gets.chomp

print 'Please enter the method name you wish to define: '
method_name = gets.chomp

print "Please enter the method's code: "
method_body = gets.chomp

my_class = DynamicClass.new(class_name)
my_class.def_method(method_name, method_body)

puts '--- Result ---'
print "Hello, your class #{class_name} with method #{method_name} is ready."\
      " Calling: #{class_name}.new.#{method_name}\n"

puts my_class.call(method_name)

