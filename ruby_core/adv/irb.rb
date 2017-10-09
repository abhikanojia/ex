# Class Interpreter
class InteractiveInterpreter
  QUIT_REGEX = /^[q]\s*$/i

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
  chopped_text = text.chomp
  break if interpreter.quit?(chopped_text)
  command << text
  if chopped_text.empty?
    p interpreter.execute_command(command)
    command.clear
  end
end