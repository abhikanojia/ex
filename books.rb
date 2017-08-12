class Books
	attr_reader   :isbn
  attr_accessor :price

	def initialize(isbn, price)
		@isbn = isbn
		@price = Float(price)
	end

	def to_s
		"ISBN : #{isbn} and Price: #{price}"
	end
end

book = Books.new("isbn1230", 120.00)
puts book

book.price = book.price * 100

puts book
