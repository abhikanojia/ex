class MaxInclusionReached < StandardError; end

module A
  @count = 0
  ["included", "extended"].each do |method_name|
    define_singleton_method(method_name) do |arg|
      raise MaxInclusionReached, "Max Inclusion Reached" if @count >= 4
      @count += 1
    end
  end

  def self.count
    @count
  end
end


# class B
#   include A
# end


class C
  extend A
end

class D
  include A
end


class E
  extend A
end


class G
  include A
end


puts A.count
