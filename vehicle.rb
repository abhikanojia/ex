# Public: Class for printing Vehicles detail.
#
# bike_name  - The Integer upto which series to be printed passed as
# command line argument.
#
# bike_price  - Price of bike, command line argument.
#
# bike_dealer - Bike dealer, command line argument.
#
# percent_price_increase - Increase in percent price of bike,
# command line argument.
class Vehicle
  attr_reader :bike_name, :bike_price

  def initialize(bike_name, bike_price)
    @bike_name   = bike_name.to_s
    @bike_price  = bike_price
  end

  def to_s
    "Bike Name: #{bike_name}\nBike Price: #{bike_price}\n"
  end
end
# Bike class inherits Vehicle class
class Bike < Vehicle
  attr_reader :bike_dealer, :percent_price_increase

  def initialize(bike_name, bike_price, bike_dealer, percent_price_increase)
    super(bike_name, bike_price)
    @bike_dealer = bike_dealer
    @percent_price_increase = Float(percent_price_increase)
  end

  def to_s
    super + "Bike Dealer: #{bike_dealer}"
  end

  def price_after_increase
    increase_in_price = Float(@bike_price) * (@percent_price_increase / 100)
    @bike_price = Float(@bike_price) + increase_in_price
    self
  end
end

if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil? || ARGV[3].nil?
  print 'Please provide an input'
  exit
else
  bike = Bike.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  puts bike
  puts "\nAfter #{ARGV[3].to_f} percent hike in price:"
  puts bike.price_after_increase
end
