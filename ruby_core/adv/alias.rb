module A
  def test
    puts "Original test method"
  end

  def new_test
    puts "New test method "
  end
  alias_method :test, :new_test
end

class B
  include A
end

B.new.test
