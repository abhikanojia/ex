class A
  def test
    p self
    p self.class # => A
    p self.class.superclass #=> Object
    #p self.superclass #=> undefined method
    #p self.self.class #=> undefined method
    #p self.self.superclass # undefined method
  end
end

A.new.test