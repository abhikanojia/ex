# def simple(param)
# 	lvar = "lvar with a value"
# 	binding
# end

# b = simple(99)

# eval "puts param", b

# class Simple
# 	def initialize
# 		@ivar = "ivar with a value"
# 	end

# 	def simple(param)
# 		lvar = "lvar with a value"
# 		binding
# 	end
# end

# s = Simple.new
# b = s.simple(99) { "block value" }

# eval "puts self", b
# eval "puts @ivar", b

def n_times(n)
	lambda { |val| n * val }
end

two_times = n_times(2)

p two_times.call(3)
p two_times
puts eval("n",two_times.binding)
