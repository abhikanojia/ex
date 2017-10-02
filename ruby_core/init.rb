class Person
  attr_reader :name
  def initialize(name="")
    @name = name.empty? ? "ABhishek" : name
  end

  def pub
    initialize
  end
end

ab = Person.new
p ab
# t = ab.pub
p ab.name