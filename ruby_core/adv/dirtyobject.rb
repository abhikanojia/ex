module DirtyObject
  module ClassMethods
    def define_dirty_attributes(*args)
      args.each do |attribute|
        instance_variable = "@#{attribute}"

        define_method("#{attribute}_was") do
          puts "#{attribute} was"
        end

        define_method("#{attribute}") do
          instance_variable_get instance_variable
        end

        define_method("#{attribute}=") do |value|
          changed(attribute.to_sym, value)
          instance_variable_set instance_variable, value
        end

        define_singleton_method(:change_hash) do
          @@changes_hash
        end

        class_eval do
          @@changes_hash = Hash.new(Array.new(2))
          def changed(symbol, value)
            puts "CHanged call"
            @@changes_hash[symbol] += [value]
          end
        end
      end
    end
  end

  def changed?
    puts "changed?"
  end

  def changes
    self.class.change_hash
    # { name: [nil, 'Akhil], age: [nil, 30] }
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
end

class User
  include DirtyObject
  attr_accessor :age

  define_dirty_attributes :name, :email
end


# p User.instance_methods

u = User.new
u.name = 'Abhishek'
p u
p u.changes