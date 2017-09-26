class InteractiveInterpreter
  attr_reader :bind

  def initialize(command)
    @command = command
  end
end

class Object
  def bindings
    binding
  end
end

t = InteractiveInterpreter.new("a = 10")

# p eval "#{t.command}", t.bindings

# p eval "a", t.get_binding

p eval "a", t.bindings
# p eval "a", t.bind

# input = true

# while input do
#   command = gets.chomp
#   if command == 'q'
#     break
#   else
#     ob = InteractiveInterpreter.new(command)
#     p ob.binding
#     #p eval "#{command}", ob.binding
#   end
# end
