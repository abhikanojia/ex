class Vehicle
  attr_reader   :bike_name, :bike_price

  def initialize(bike_name, bike_price)
    @bike_name   = bike_name.to_s
    @bike_price  = Float(bike_price)
  end

  def to_s
    "Bike Name: #{bike_name} \nBike Price: #{bike_price} \n"
  end
end

class Bike < Vehicle
  attr_reader :bike_dealer, :percent_price_increase, :bike_price

  def initialize(bike_name, bike_price, bike_dealer, percent_price_increase)
    super(bike_name, bike_price)
    @bike_dealer = bike_dealer
    @percent_price_increase = Float(percent_price_increase)
  end

  def to_s
    super + "Bike Dealer: #{bike_dealer}\n"
  end

  def price_after_increase
    puts '1'
    bike_price += bike_price * (percent_price_increase / 100)
    puts 'b'
  end
end

if ARGV.empty?
  print "Please provide an input"
  exit
else
  bike = Bike.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  bike.price_after_increase
end
