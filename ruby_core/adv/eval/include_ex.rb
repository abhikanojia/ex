module A; end

class B
  prepend A
  # include A
end

class C < B
  prepend A
end

# p B.ancestors
# p B.singleton_class.ancestors
p C.ancestors