class FibonacciSeries
  attr_reader :num
  
  def initialize(num)
    @num = num
  end

  def print_series
    i, j = 0, 1
    print i, j
    k = i + j
    while k <= @num
      print k
      i = j
      j = k
      k = i + j
    end
  end
end

if ARGV.empty?
  print "Please provide an input"
  exit
else
  num = ARGV[0].to_i
  obj = FibonacciSeries.new(num)
  obj.print_series
end