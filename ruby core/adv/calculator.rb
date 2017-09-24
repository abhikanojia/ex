class String
  def to_operator_symbol
    delete(":").to_sym
  end
end

class Calculator
  def initialize(string)
    @expression = string.split(',')
  end

  def calculate
    [@expression.first.to_i, @expression.last.to_i].inject(@expression[1].to_operator_symbol)
  end
end

if $*.empty?
  print 'Please provide an input'
else
  object = Calculator.new($*.first)
  puts object.calculate
end
