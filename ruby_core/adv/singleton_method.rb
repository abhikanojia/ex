# create new instance of stirng
string_instance = String.new('String Instance')

# singleton method using def
def string_instance.change
  gsub(/[aeiou]/i, '*')
end

p string_instance.change

# singleton method using class <<
class << string_instance
  def change_this
    swapcase
  end
end

p string_instance.change_this

# calling on other string instance
another_string = String.new('Another String')

another_string.change_this # this should give an error
