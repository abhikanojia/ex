# method to calculate factorial of given number
class Integer
  def factorial
    if self <= 0
      1
    else
      (1..self).to_a.inject(:*)
    end
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  print ARGV[0].to_i.factorial
end
