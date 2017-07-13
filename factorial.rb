# method to calculate factorial of given number
class Integer
  def factorial
    n = self
    if n <= 0
      1
    else
      (1..n).to_a.inject(:*)
    end
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  print ARGV[0].to_i.factorial
end
