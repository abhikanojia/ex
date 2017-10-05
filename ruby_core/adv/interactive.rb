# Class Interpreter
class InteractiveInterpreter
  attr_accessor :result
  def initialize
    @result
  end

  def execute_command(command, bind)
    @result = eval(command, bind)
  end

  def get_binding
    binding
  end

  def quit?(command)
    command == "q\n"
  end
end

interpreter = InteractiveInterpreter.new
current_binding = interpreter.get_binding
# command = ""
# loop do
#   begin
#     current_command = gets
#     break if interpreter.quit?(command)
#     command << current_command
#     current_command.clear
#     interpreter.execute_command(command, current_binding)
#     if current_command == "\n"
#       interpreter.result
#       interpreter.result = ""
#     end
#   rescue Exception => error
#     puts error.message
#     retry
#   end
# end

loop do
  begin
    command = gets.chomp
    break if interpreter.check_input(command)
    interpreter.execute_command(current_binding, command)
    puts interpreter.result
  rescue Exception => error
    puts error.message
    retry
  end
end