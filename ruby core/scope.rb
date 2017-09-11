class B
  def initialize(name)
    @name = name
  end
  
  def name
    @name
  end

  def greet
    name = "test"
    "Hi! #{name}"
  end
end

p B.new("ABhisehk").greet