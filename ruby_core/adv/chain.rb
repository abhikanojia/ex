class GrandParent
end

class Parent < GrandParent
  include Comparable
end

class Mod < Parent
end

class ChildMod < Mod
end

p ChildMod.singleton_class.ancestors
