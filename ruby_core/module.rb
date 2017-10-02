module Test
  private

  def method_name
    "private method"
  end
end

class A
  include Test
end

p A.new.method