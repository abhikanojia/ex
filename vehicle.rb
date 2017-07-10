# Public: Class for printing Vehicles detail.
#
# name  - The Integer upto which series to be printed passed as
# command line argument.
#
# price  - Price of bike, command line argument.
#
# dealer - Bike dealer, command line argument.
#
# percent_price_increase - Increase in percent price of bike,
# command line argument.
class Vehicle
  attr_reader :name
  attr_accessor :price

  def initialize(name, price)
    @name   = name.to_s
    @price  = price
    self.class.count += 1
  end

  def to_s
    "Bike Name: #{name}\nBike Price: #{price}\n"
  end
end
# Bike class inherits Vehicle class
class Bike < Vehicle
  attr_reader :dealer, :percent_price_increase
  attr_accessor :price

  def initialize(name, price, dealer, percent_price_increase)
    super(name, price)
    @dealer = dealer
    @percent_price_increase = Float(percent_price_increase)
  end

  def to_s
    super + "Bike Dealer: #{dealer}"
  end

  def price_after_increase
    increase_in_price = Float(@price) * (@percent_price_increase / 100)
    @price = Float(@price) + increase_in_price
  end
end

if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil? || ARGV[3].nil?
  print 'Please provide an input'
  exit
else
  bike = Bike.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  puts bike
  puts "\nAfter #{ARGV[3].to_f} percent hike in price:"
  bike.price_after_increase
  print bike
end
