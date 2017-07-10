class Example
  @count = 0
  def initialize
    self.count = 1
  end

  def to_s
    "Value : @count"
  end
end

# Create Objects
object = Example.new()
puts object
