# Public: Method for printing fibonacci series.
# All methods should be called on the FibonacciSeries class object.
#
# num  - The Integer upto which series to be printed passed as
# command line argument.
#
# {|k| print k + " " } - Block for printing the output number which is passed to
# print series funtion.
#
# Examples
#
#   obj = FibonacciSeries.new(10)
#   obj.print_series { |k| print k + " " }
#   # => 1 1 2 3 5 8
class FibonacciSeries
  def initialize(num)
    if num[0].nil?
      print 'Please provide an input'
      exit
    else
      # considering multiple arguments as a single string
      @num = num[0].to_i
    end
  end

  def print_series
    i = 0
    j = 1
    yield(j.to_s)
    k = i + j
    while k < @num
      yield(k.to_s)
      i = j
      j = k
      k = i + j
    end
  end
end

obj = FibonacciSeries.new(ARGV)
obj.print_series { |k| print k + ' ' }
