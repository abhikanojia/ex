class Multiplier
  def self.create_multiplier(n)
    define_method("times_#{n}") do |val|
      val * n
    end
  end
  10.times { |x| create_multiplier(x) }
  create_multiplier(2)
  create_multiplier(3)
end

m = Multiplier.new
p m.times_2(2)
p m.times_3(2)
p m.times_9(2)
