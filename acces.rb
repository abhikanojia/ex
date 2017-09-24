class Test
  class << self
    attr_accessor :count
  end
  @count = 0

  def initialize
    Test.count += 1
  end
end

Test.new
Test.new
Test.new
Test.new
p Test.count
