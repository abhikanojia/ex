module A
  module B; end
    module C
      module D
        B == A::B
        p Module.nesting
      end
    end
end
