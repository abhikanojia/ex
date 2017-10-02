# module Mod
#   include Math
#   prepend Enumerable
#   extend Comparable
# end

# p Mod.ancestors

module Foo
  class Bar
    VAL = 10
  end

  class Baz < Bar; end
end

p Foo.const_get 'Foo::Bar::VAL'
p Foo::Bar::VAL
p Foo::Baz.constants