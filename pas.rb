# Pascal triangle
class PascalTriangle
  def self.print_upto(number)
    (0...number).map { |num| yield pascal_row(num) }
  end

  def self.factorial(number)
    (1..number).inject(1, :*)
  end

  def self.binomial(numerator, denominator)
    factorial(numerator) / (factorial(denominator) * factorial(numerator - denominator))
  end

  def self.pascal_row(row)
    (0..row).map { |column| binomial(row, column) }
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  PascalTriangle.print_upto(ARGV.first.to_i) do |row|
    print row.join(' ') + " \n"
  end
end