module StringRefine
  def test
    "Asd"
  end
  refine String do
    def length
      "length"
    end
  end
end


class A
  include StringRefine
end

using StringRefine

p "asd".length

p A.new.test
p A.new.length