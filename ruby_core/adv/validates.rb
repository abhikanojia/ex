module Validates
  module ClassMethods
    def validates(*args)
      p args
    end
  end

  module InstanceMethods

  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end

class A
  include Validates
  attr_accessor :name

  validates :name, presence: true
end

ob = A.new
ob.name = "Abhishek"
p ob