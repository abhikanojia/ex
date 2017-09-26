module Persistable
  def self.included(cls)
    cls.extend ClassMethods
  end

  module ClassMethods
    def find
      puts "iN find"
      ne w
    end
  end

  def save
    puts "In save"
  end
end

class Person
  include Persistable
  #extend Persistable::ClassMethods
end

p = Person.find

p.save
p p
