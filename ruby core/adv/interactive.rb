# class InteractiveInterpreter
#   def initialize

#   end

#   def

#   end
# end

input = true

while input do
  command = gets.chomp
  if command == 'q'
    break
  else
    p eval "command"
  end
end