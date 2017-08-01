# method to calculate factorial of given number
class NegativeNumberError < StandardError; end
# If no argument is given to
class NoArgumentError < StandardError; end
# Method - factorial to calculate factorial on given number
class Integer
  def factorial
    return 1 if self == 0
    (1..self).to_a.inject(:*)
  end
end

begin
  raise NoArgumentError if ARGV[0].nil?
  raise NegativeNumberError if ARGV[0].to_i < 0
  print ARGV[0].to_i.factorial
rescue NoArgumentError
  print 'Please provide an input'
rescue NegativeNumberError
  print 'Negative number entered'
end
