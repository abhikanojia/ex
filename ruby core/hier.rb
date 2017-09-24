module Mod
end

class Parent
end

class Child < Parent
  include Mod
end

class ChildsChild < Child
end


obj = ChildsChild.new
K = Class.new
p K.ancestors
p Class.ancestors