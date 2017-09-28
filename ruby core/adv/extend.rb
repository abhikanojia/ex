module Persistable
  def self.extend_object(o)
    if o == String
      print "Cant extend from String"
    else
      super
    end
  end

  def test
    puts "asdads"
  end
end

class A
  extend Persistable
end

A.test
