# get the values of the array provided
class String
  def array_values
    tr('\[|\]', '').split(/\,/).map(&:to_s)
  end
end
# reverse_iterate function
class Array
  def reverse_iterate
    b = reverse
    0.upto(b.length) { |x| yield b[x] }
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  b = ARGV[0].array_values
  b.reverse_iterate { |i| print "#{i} " }
end