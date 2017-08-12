# Public - Method for printing pascal's triangle using yield
class PascalTriangle
  def self.print_upto(number)
    
    (1..number).each do |row|
      line = []
      next_number = 1
      (1..row).each do |col|
        line << next_number
        next_number = next_number * (row - col) / col
      end
      yield line.join(' ')
    end
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  PascalTriangle::print_upto(ARGV.first.to_i) do |number|
    #print number.zero? ? "\n" : "#{number} "
    puts "#{number} "
  end
end
