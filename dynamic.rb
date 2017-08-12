class Test
  attr_reader :name, :race
  attr_accessor :age

  def initialize(name, race)
    @name = name
    @race = race
  end
end

obj = Test.new("Abhi", "asian")
obj.age = 23
p obj
