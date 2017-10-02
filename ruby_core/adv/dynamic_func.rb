class MaxInclusionReached < StandardError
  def initialize(msg)
    puts "#{msg}"
  end
end

module A
  @methods_callable = ["included", "extended"]
  @count = 0
  @methods_callable.each do |method_name|
    define_singleton_method(method_name) do |arg|
      raise MaxInclusionReached, "Max Reached" if @count >= 4
      @count += 1
    end
  end
end


class B
  include A
  extend A
  extend A
  extend A
  extend A
end

p A.count
