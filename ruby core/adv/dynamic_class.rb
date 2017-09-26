# error class
class ClassRedefinitionError < StandardError; end

# Dynamic Class generator class
class DynamicClass
  def initialize(input_class_name)
    validate(input_class_name.capitalize! || input_class_name)
    @class_name = Class.new { Object.const_set(input_class_name, self) }
  end

  def create_method(method_name, method_body)
    @class_name.class_eval do
      define_method(method_name) { instance_eval(method_body) }
    end
  end

  def validate(class_name)
    raise ClassRedefinitionError if const_defined? class_name
  rescue => error
    print "#{error} : #{class_name} class already exists in ruby. Exiting..\n"
    exit
  end

  def call_method(method_name)
    @class_name.new.public_send(method_name)
  end
end

# take input from user

print 'Please enter the class name: '
name_of_class = gets.chomp

dynamic_class = DynamicClass.new(name_of_class)

print 'Please enter the method name you wish to define: '
name_of_method = gets.chomp

print "Please enter the method's code in quotes: "
body_of_method = gets.chomp

dynamic_class.create_method(name_of_method, body_of_method)

puts '--- Result ---'
print "Hello, your class #{name_of_class} with method #{name_of_method} is ready."\
      " Calling: #{name_of_class}.new.#{name_of_method}\n"

puts dynamic_class.call_method(name_of_method)
