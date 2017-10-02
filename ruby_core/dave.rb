class Dave
  @count = 0
  class << self
    attr_accessor :count
  end
  
  def initialize
    Dave.count += 1
  end
end


d1 = Dave.new
p d1
d1 = Dave.new
p d1
d2 = Dave.new
p Dave.count
