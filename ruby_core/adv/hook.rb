# module Persistable
#   module ClassMethods
#     def find(param)
#       puts "find called"
#     end
#   end
#
#   def self.included(klass)
#     klass.extend ClassMethods
#     puts "#{self} included in #{klass}"
#   end
#
#   def test
#     puts "test instance method"
#   end
# end
#
# module People
#   include Persistable
# end
#
# class Person
#   include Persistable
# end
#
# Person.find(1)
#
# Person.new.test

# METHOD_ADDED HOOK

class Dave
  def self.method_added(name)
    puts "Added method #{name}"
  end

  def fred

  end

  def wilma

  end
end
