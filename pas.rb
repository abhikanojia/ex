# Pascal triangle
class PascalTriangle
  def self.print_upto(number)
    (0...number).map{ |number| yield pascal_row(number) }
  end

  def self.factorial(number)
    (1..number).inject(1, :*)
  end

  def self.binomial(n, r)
    factorial(n) / ( factorial(r) * factorial(n-r) )
  end

  def self.pascal_row(row)
    (0..row).map{ |col| binomial(row, col) }
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  PascalTriangle.print_upto(ARGV.first.to_i) do |row|
    print row.join(' ')
    puts
  end
end