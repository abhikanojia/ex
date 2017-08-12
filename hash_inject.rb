# Public - Method
# return hash having even an odd length strings
# grouped
class Array
  def array_hash
    hash = Hash.new([])
    each { |item| hash[item.length] += [item] }
    new_hash = hash.to_h
    output = Hash.new([])
    new_hash.inject(output) do |_, value|
      if value[0].odd?
        output['odd'] += [value[1]]
      else
        output['even'] = [value[1]]
      end
    end
    output
  end
end
# Method - to_array converts string style array to array values
class String
  def to_array
    tr('"|[|]|\'', '').split(/\,/).map(&:to_s)
  end
end

if ARGV.first.nil?
  print 'Please provide an input'
else
  arr = ARGV.first.to_array
  puts arr.array_hash
end
