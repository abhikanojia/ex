class Roulette
  def method_missing(name, *args)
    person = nameok 
    number = 0
    3.times do
      number = rand(0..10) + 1
      puts "#{number}.."
    end
    "#{person} got a #{number}"
  end
end

number_of = Roulette.new

p number_of.bob
