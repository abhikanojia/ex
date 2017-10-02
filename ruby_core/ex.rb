# def count_with_increment(start, inc)
# 	start -= inc
# 	lambda { start += inc  }
# end

def test(s)
	lambda { s += 1 }
end
counter = test(10)

puts counter.call
puts counter.call
puts counter.call