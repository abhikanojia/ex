module Logger
  def log(msg)
   STDERR.puts msg 
  end
end

animal = "cat"

# animal.extend Logger

class Truck
  extend Logger
end

Truck.log("Greetings from the truck")