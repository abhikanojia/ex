class DynamicMethod < String
  def replace_vowels_with(character = '*')
    gsub(/[aeiou]/i, character)
  end

  def exclude?(arg)
    !include?(arg)
  end

  def list_of_methods
    self.class.instance_methods(false)
  end

  def call_method(name, *arg)
    public_send(name, *arg) if list_of_methods.member? name.to_sym
  rescue ArgumentError => e
    print 'Please provide argument to call #{name}.to_sym'
    args = gets
    call_method(name, args)
  end
end

class UserInput
  def initialize
    prompt.first
  end

  def prompt
    ['Please enter a string to call function on']
  end
end

input = UserInput.new
entered_string =
string = DynamicMethod.new("Test")

p string.list_of_methods
print '-' * 20 + "Result" + '-' * 20
p string.call_method("replace_vowels_with", "*")

# p string.replace_vowels_with
