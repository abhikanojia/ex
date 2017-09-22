class Module
  def ancestors
    y = []
    curr = self
    y << self
    while curr
      y << curr.superclass
      y << curr.included_modules
      curr = curr.superclass
    end
    y.flatten.compact.uniq.join('-->')
  end
end

class A
end

p A.ancestors
