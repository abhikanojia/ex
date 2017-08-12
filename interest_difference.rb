# Interest class for calculating difference of ci and si
class Interest
  def initialize(&block)
    @block = block
  end

  def show_diff(principal, time, rate)
    @block.call(calculate_diff(principal, time, rate))
  end

  private

  def calculate_diff(principal, time, rate)
    si = principal * (1 + (rate * time))
    ci = principal * ((1 + rate)**time)
    ci - si
  end
end

if ARGV[0].nil? || ARGV[1].nil?
  print 'Please provide an input'
  exit
else
  rate = Float(10) / 100
  principal = ARGV[0].to_f
  time = ARGV[1].to_f
  ob = Interest.new do |difference|
    print format('Interest difference= %.2f', difference)
  end
  ob.show_diff(principal, time, rate)
end
