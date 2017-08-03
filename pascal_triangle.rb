# Public - Method for printing pascal's triangle using yield
def pascal(number)
  (1..number).each do |row|
    to_print = 1
    (1..row).each do |col|
      yield to_print
      to_print = to_print * (row - col) / col
    end
    puts if row < number
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
else
  pascal(ARGV[0].to_i) do |number|
    print "#{number} "
  end
end
