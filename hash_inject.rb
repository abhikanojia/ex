# Public - Method
# return hash having even an odd length strings
# grouped
class Array
  def group_by_odd_even
    output_hash = Hash.new([])
    group_by_length.inject(output_hash) do |_, (key, value)|
      key = if key.odd?
        'odd'
      else
        'even'
      end
      output_hash[key] += [value]
    end
    output_hash
  end

  private

  def group_by_length
    hash = Hash.new([])
    each { |item| hash[item.length] += [item] }
    hash
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
  puts arr.group_by_odd_even
end
