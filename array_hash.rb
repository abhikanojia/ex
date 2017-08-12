# Method for returning sorted hash
class Array
  def array_hash
    hash = Hash.new([])
    each { |x| hash[x.length] += [x] }
    hash.sort_by { |length, _| length }.to_h
  end
end
# for converting string representation of array to
# array
class String
  def to_array
    require 'json'
    JSON.parse(tr("'", '"'))
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  array_string = ARGV[0].to_array.map(&:to_s)
  print array_string.array_hash
end
