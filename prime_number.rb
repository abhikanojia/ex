# Method for printing primes
class Integer
  def divides?(x)
    self % x == 0
  end

  def prime?
    2.upto(self / 2) do |x|
      return false if divides?(x)
    end
    true
  end

  def print_primes
    Enumerator.new do |yielder|
      (2..self).step(1) do |num|
        yielder.yield num if num.prime?
      end
    end
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  print ARGV[0].to_i.print_primes.first(ARGV[0].to_i)
end
