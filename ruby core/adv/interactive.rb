# Class Interpreter
class InteractiveInterpreter
  attr_reader :result
  def initialize
    @result
  end

  def get_binding
    binding
  end

  def execute_command(current_binding, command)
    @result = eval(command, current_binding)
  end

  def check_input(command)
    command == 'q'
  end
end

interpreter = InteractiveInterpreter.new
current_binding = interpreter.get_binding

loop do
  begin
    command = gets.chomp
    break if interpreter.check_input(command)
    interpreter.execute_command(current_binding, command)
    puts interpreter.result
  rescue
  end
end
