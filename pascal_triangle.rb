# Public - Method for printing pascal's triangle using yield
def pascal(number)
  (1..number).step(1) do |row|
    c = 1
    (1..row).step(1) do |col|
      yield c
      c = c * (row - col) / col
    end
    puts  if row < number
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  pascal(ARGV[0].to_i) do |number|
    print number.to_s + ' '
  end
end
