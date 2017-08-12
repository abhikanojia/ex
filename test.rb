class Animal
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "Name: #{name}\nPrice: #{price}"
  end
end

class Cat < Animal
  attr_reader :breed
  def initialize(name, price, breed)
    super(name, price)
    @breed = breed
  end

  def to_s
    super + "\nBreed: #{breed}"
  end

  def price_after_change
    @price += 10
  end
end

cat = Cat.new("test",12,"cats")
puts cat
cat.price_after_change
puts cat
