# to test access specifiers
class Test
  def initialize
    @secret = 99
  end

  def test
    print "test from private"
  end

  protected

  def testp
    print "test from protected"
  end
end

class Another < Test
  def test
    super
  end
end

another = Another.new
another.test
