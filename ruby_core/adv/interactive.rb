# Class Interpreter
class InteractiveInterpreter
  attr_reader :result
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
    command == 'q'
  end
end

interpreter = InteractiveInterpreter.new
current_binding = interpreter.get_binding

loop do
  begin
    command = gets.chomp
    break if interpreter.quit?(command)
    interpreter.execute_command(command, current_binding)
    puts interpreter.result
  rescue Exception => error
    puts error.message
    retry
  end
end
