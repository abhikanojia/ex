# Interest class for calculating difference of ci and si
class Interest
  def initialize(&block)
    @block = block
  end

  def calculate_diff(p, t)
    @block.call(p, t)
  end
end

if ARGV[0].nil? || ARGV[1].nil?
  print 'Please provide an input'
  exit
else
  rate = Float(10) / 100
  principal = ARGV[0].to_f
  time = ARGV[1].to_f
  ob = Interest.new do |p, t|
    si = p * (1 + (rate * t))
    ci = p * ((1 + rate)**t)
    ci - si
  end
  print format('Interest difference= %.2f', ob.calculate_diff(principal, time))
end
