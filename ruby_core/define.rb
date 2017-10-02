class Multiplier
	def self.create_multiplier(n)
		define_method("times_#{n}") do |val|
			val * n.to_i
		end
	end
	# create_multiplier(2)
end

Multiplier.create_multiplier("2")
m = Multiplier.new
puts m.times_2(3)