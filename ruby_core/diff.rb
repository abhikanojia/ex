def method
	puts "at top"
	pr = lambda { return }
	pr.call
	puts "at end"
end

def method_name
	[1,2,3].each do |val|
		return if val > 2
		puts val
	end
end

puts "before method call"

method_name

puts "after method call"
