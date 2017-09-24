class Array
  def count
    count = 0
    each { |i| count += 1 }
  end
end
a = (1..10).to_a
print a.count