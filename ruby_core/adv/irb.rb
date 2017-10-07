# Class Interpreter
class InteractiveInterpreter
  QUIT_REGEX = /q/i

  def execute_command(command)
    eval(command, TOPLEVEL_BINDING)
  end

  def quit?(command)
    command.match? QUIT_REGEX
  end
end

interpreter = InteractiveInterpreter.new

command = ''

loop do
  text = gets
  break if interpreter.quit?(text.chomp)
  command << text
  if text == "\n"
    p interpreter.execute_command(command)
    command.clear
  end
  text.clear
end