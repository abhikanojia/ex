# Public - Method for printing pascal's triangle using yield
class PascalTriangle
  def self.print_upto(number)
    (1..number).each do |row|
      num = []
      output_number = 1
      (1..row).each do |col|
        num += [output_number]
        output_number = output_number * (row - col) / col
      end
      yield num
    end
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  PascalTriangle::print_upto(ARGV.first.to_i) do |number|
    number.each{ |num| print "#{num} " }
    puts
  end
end
