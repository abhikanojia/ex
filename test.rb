class Test
  attr_reader :val
  def initialize(str)
  	@val = str
  end

  def to_s
  	@val
  end
end

b = Test.new("test")
b.regex_eval