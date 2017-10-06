# # Class Interpreter
# class InteractiveInterpreter
#   attr_reader :result
#   def initialize
#     @result
#   end

#   def get_binding
#     binding
#   end

#   def execute_command(current_binding, command)
#     @result = eval(command, current_binding)
#   end

#   def quit?(command)
#     command == "q"
#   end
# end

# interpreter = InteractiveInterpreter.new
# current_binding = interpreter.get_binding

# loop do
#   begin
#     command = gets.chomp
#     break if interpreter.quit?(command)
#     interpreter.execute_command(current_binding, command)
#     puts interpreter.result if gets == "\n"
#   rescue Exception => error
#     command << gets
#   end
# end

command = ''
loop do
  text = gets
  break if text == "q\n"
  until text == "\n"
    break if text == "q\n"
    command << text
  end
end


p eval command