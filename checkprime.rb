class Integer
  def prime?
    flag = true
    (2).upto(self / 2) do |x|
      if self % x == 0
        return false
      end
    end
    return true
  end
end

print 13.prime?
