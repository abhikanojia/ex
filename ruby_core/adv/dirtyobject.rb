module DirtyObject
  module ClassMethods
    def define_dirty_attributes(*args)
      args.each do |attribute|
        instance_variable = "@#{attribute}"

        define_method("#{attribute}_was") do
          @@changes_hash[attribute].first
        end

        define_method("#{attribute}") do
          instance_variable_get instance_variable
        end

        define_method("#{attribute}=") do |value|
          changed(attribute.to_sym, value)
          instance_variable_set instance_variable, value
        end

        define_singleton_method(:change_in_hash) do
          !@@changed_status ? {} : @@changes_hash
        end

        define_singleton_method(:changed_status?) do
          @@changed_status
        end

        define_singleton_method(:save_object) do
          @@changed_status = false
          true
        end

        class_eval do
          @@changed_status = false
          @@changes_hash = Hash.new(Array.new(2))
          def changed(symbol, value)
            if @@changes_hash[symbol].include? value
              @@changes_hash.delete(symbol)
              @@changed_status = false
            else
              @@changes_hash[symbol] += [value]
              @@changed_status = true
            end
            @@changes_hash[symbol].delete_at(0)
          end
        end
      end
    end
  end

  def changed?
    self.class.changed_status?
  end

  def save
    self.class.save_object
  end

  def changes
    self.class.change_in_hash
    # { name: [nil, 'Akhil'], age: [nil, 30] }
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
end

class User
  include DirtyObject
  attr_accessor :email

  define_dirty_attributes :name, :age
end


# p User.instance_methods

u = User.new
u.name = 'Abhishek'
u.email = 'abhishek@vinsol.com'
u.age = 23

p u.changed?
p u.changes


p u.name_was
# p u.email_was
p u.age_was

puts "----------Saving Object ------"
p u.save # yet to implement

puts '--------CHeck again---------'
p u.changed?
p u.changes

puts '----------Assigned new value---------'
u.name = 'Mayank'
u.age = 19
p u.changes
p u.name_was

puts '---------Name was----------'
u.name = "Abhishek"
p u.changes
p u.changed?

u.age = 23
p u.changes
p u.changed?