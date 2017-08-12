# Public- Method for returning power array
class Array
  def power(x)
    collect { |value| value**x }
  end
end

if ARGV[0].nil? || ARGV[1].nil?
  print 'Please provide an input'
  exit
elsif ARGV[0].is_a? String
  require 'json'
  ARGV[0] = JSON.parse ARGV[0]
  print ARGV[0].power(ARGV[1].to_i)
end
