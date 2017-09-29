class DynamicMethod < String
  def replace_vowels_with(character)
    gsub(/[aeiou]/i, character)
  end

  def exclude?(arg)
    !(include?(arg))
  end

  def list_of_methods
    self.class.instance_methods(false)
  end

  def call_method(method_name, *arg)
   return public_send(method_name, *arg) if list_of_methods.include? method_name.to_sym
   'No Method Exists by that name'
  rescue ArgumentError => e
    puts "Please provide argument to call #{method_name} function: "
    args = gets.chomp
    call_method(method_name, *args)
  end
end


puts 'Please enter the string to call function on: '
input_string = gets.chomp
puts

string = DynamicMethod.new(input_string)

puts 'List of methods available for this input.'
p string.list_of_methods
puts


puts 'Enter the name of method you want to execute from list'
method_to_execute = gets.chomp
puts


# puts '-' * 20 + " Result " + '-' * 20
p string.call_method(method_to_execute)

