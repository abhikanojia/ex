# Public - Method for printing pascal's triangle using yield
class PascalTriangle
  def self.print_upto(number)
    (1..number).each do |row|
      pascal_row = []
      next_number = 1
      (1..row).each do |col|
        pascal_row << next_number
        next_number = next_number * (row - col) / col
      end
      yield pascal_row.join(' ')
    end
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
else
  PascalTriangle.print_upto(ARGV.first.to_i) do |number|
    puts "#{number} "
  end
end