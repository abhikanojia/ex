module Mod
end

class A
  include Mod
end

class B < A
  prepend Mod
end

class D < B
  include Mod
end

class C < B
  include Mod
  extend Mod
  prepend Mod
end


p C.ancestors