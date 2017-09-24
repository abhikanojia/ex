# method for converting string operator to operator symbol
class String
  def to_operator_symbol
    delete(':').to_sym
  end
end
# Calculator class
class Calculator
  def initialize(input)
    expression = input.split(',')
    @operand1 = expression.first.to_f
    @operand2 = expression.last.to_f
    @operator = expression[1].to_operator_symbol
  end

  def calculate
    @operand1.send(@operator, @operand2)
  end
end

if ARGV.empty?
  print 'Please provide an input'
else
  object = Calculator.new(ARGV.first)
  puts object.calculate
end