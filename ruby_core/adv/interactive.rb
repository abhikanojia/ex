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
    command == "q"
  end
end

interpreter = InteractiveInterpreter.new
current_binding = interpreter.get_binding
p current_binding

loop do
  begin
    command = gets.chomp
    break if interpreter.quit?(command)
    interpreter.execute_command(current_binding, command)
    puts interpreter.result
  rescue Exception => error
    puts error.message
    retry
  end
end

# loop do
#   begin
#     command = gets
#     break if interpreter.quit?(command)
#     interpreter.execute_command(current_binding, command)
#     puts interpreter.result
#   rescue Exception => e
#     p e.message
#     exit
#   end
# end