class K
  def mart
    "mart from class"
  end
end

k = K.new
p k
p k.singleton_class

p k.singleton_class.instance_methods(false)

def k.mart
  "mart from singleton_class"
end

p k.singleton_class.instance_methods(false)

p k.singleton_class.instance_method(:mart)

p k.mart

#<K:0x0055a31dc5efe8>
#<Class:#<K:0x0055a31dc5efe8>>
# []
# []
# #<UnboundMethod: K#mart>
# "mart from class"
# [Finished in 0.095s]
