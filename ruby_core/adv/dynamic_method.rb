# param list method return methods
class Array
  def params_list
    flatten.delete_if { |item| item =~ /req|opt/ }
  end

  def segregate
    hash = Hash.new([])
    each do |arr|
      hash[arr.first] += [arr[1]]
    end
    hash
  end
end

# Interactive Class
class InteractiveClass < String
  VOWELS = /[aeiou]/i

  def replace_vowels_with(character)
    gsub(VOWELS, character)
  end

  def exclude?(arg)
    !(include? arg)
  end

  def abx(a, b, c = 1)
    print a, b, c
  end

  def list_of_methods
    self.class.instance_methods(false)
  end

  def reverse_by_word
    split(' ').reverse.join(' ')
  end

  def params(method_name)
    self.method(method_name.to_sym).parameters.segregate
  end

  def execute(method_name, *arg)
    return public_send(method_name, *arg) if list_of_methods.include? method_name.to_sym
    'No Method Exists by that name'
  end
end


puts 'Please enter the string to call function on: '
input_string = gets.chomp
puts

string = InteractiveClass.new(input_string)

puts 'List of methods available for this input.'
p string.list_of_methods
puts

puts 'Enter the name of method you want to execute from list'
method_to_execute = gets.chomp

params = string.params(method_to_execute)

parameters_required = []

if params.key? :req
  params[:req].each do |req_param|
    print "Please provide mandatory parameter: #{req_param} "
    parameters_required << gets.chomp
  end
end

if params.key? :opt
  params[:opt].each do |req_param|
    print "Please provide optional parameter: #{req_param} "
    parameters_required << gets.chomp
  end
end

parameters_required.delete_if(&:empty?)

begin
  p string.execute(method_to_execute, *parameters_required)
rescue ArgumentError => e
  print e.message
end