module BluePrint
  module ClassMethods

  end

  module InstanceMethods
    # def initialize
    #   @@tables = []
    # end

    def integer

    end

    def varchar

    end

    def bool

    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
end

class Table
  include BluePrint
  def create_table(table_name, &block)
    @@tables.push(table_name)
  end
end


tc = Table.new
tc.create_table :users do |x|
  x.integer :age , default: 5
  x.integer :amount, default: 6
  x.varchar :name, null: false
end

# CREATE Table users (
#   age int(5),
#   amount int(6)
#   name varchar, not null
# )

tc.create_table :admins do |x|
  x.integer :age , default: 5
  x.integer :amount, default: 6
  x.varchar :name
end

Table.tables
# tc.to_sql
# p TableCreator.query