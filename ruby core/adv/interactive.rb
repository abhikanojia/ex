# class InteractiveInterpreter
#   def initialize

#   end

#   def

#   end
# end

def get_binding(command)
  binding
end
input = true

while input do
  command = gets.chomp
  if command == 'q'
    break
  else
    # p command
    p eval "#{command}", get_binding(command)
  end
end
