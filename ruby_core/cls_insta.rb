class A
  @@count = 1
  def self.count_val
    @count
  end

  def count
    @@count
  end
end

p A.new.count
# p A.new.count