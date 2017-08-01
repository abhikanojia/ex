# get the values of the array provided
class String
  def array_values
    tr('\[|\]', '').split(/\,/).map(&:to_s)
  end
end
# reverse_iterate function
class Array
  def reverse_iterate
    (length-1).downto(0) { |x| yield self[x] }
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  b = ARGV[0].array_values
  b.reverse_iterate { |i| print "#{i} " }
end
