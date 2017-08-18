class List
  attr_reader :items
  def initialize
    @items = []
  end

  def total
    @sub = 0
    p @items
    @items.inject(@sub) { |sum, item| sum += item.price}
  end
end 

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @list = List.new
    @name = name
    @price = price.to_f
  end

  def add_to_cart
    @list.items << self
  end

  def total_price
    @list.total
  end
end

p1 = Product.new("chocolate", 12.0)
p2 = Product.new("choco", 14.0)

p1.add_to_cart
p2.add_to_cart

print p1.total_price