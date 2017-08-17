# Public - Method for printing pascal's triangle using yield
class PascalTriangle
  def self.print_upto(number)
    (1..number).each do |row|
      line = []
      number = 1
      (1..row).each do |col|
        line << number
        # next_number = next_number * (row - col) / col
        number = next_number(number, row, col)
      end
      yield line
    end
  end

  def self.next_number(number, row, col)
    number * (row - col) / col
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  PascalTriangle::print_upto(ARGV.first.to_i) do |number|
    # print number.zero? ? "\n" : "#{number} "
    # puts "#{number} ".join(' ')
    puts number.join(' ')
  end
end
