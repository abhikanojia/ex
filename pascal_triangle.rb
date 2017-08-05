# Public - Method for printing pascal's triangle using yield
class PascalTriangle
  def print_upto(number)
    (1..number).each do |row|
      to_print = 1
      (1..row).each do |col|
        yield to_print
        to_print = to_print * (row - col) / col
      end
      yield 0 if row < number
    end
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
else
  obj = PascalTriangle.new
  obj.print_upto(ARGV.first.to_i) do |number|
    print number.zero? ? "\n" : "#{number} "
  end
end
