class Books
	attr_reader :isbn, :price

	def initialize(isbn, price)
		@isbn = isbn
		@price = Float(price)
	end

	def to_s
		"ISBN : #{@isbn} and Price: #{@price}"
	end
end

b1 = Books.new("isbn1", 12)
puts b1

b3 = Books.new("isbn3", 12.12)
puts b3

b2 = Books.new("isbn2", "12.22")
puts b2