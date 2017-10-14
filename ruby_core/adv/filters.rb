module Filters
  module ClassMethods
    def before_action(*arguments)
      p arguments
      class_instance_methods = instance_methods(false)
      class_instance_methods.delete(arguments.first)
      class_instance_methods.each do |method_name|
        alias_method :"original_#{method_name}", method_name
        define_method(method_name) do |*args|
          self.send (arguments.first)
          self.send(:"original_#{method_name}", *args)
        end
      end
    end

    def after_action(*arguments)

    end

    def around_action(*arguments)

    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
  end
end

class BaseController
  include Filters

  def new
    p "new"
  end

  def create
    p "create"
  end

  def required_login
    p "required_login"
  end

  def method_name
    p "method name"
  end

  before_action :required_login
end

ob = BaseController.new
ob.new
ob.create
ob.method_name
# p BaseController.instance_methods(false)