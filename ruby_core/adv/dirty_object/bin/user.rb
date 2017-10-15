# require dirty object
require_relative '../lib/dirty_object.rb'
# User class includes dirty object
class User
  include DirtyObject
  attr_accessor :name, :age, :email
  define_dirty_attributes :name, :age
end

u = User.new

p u.name # nil
p u.age # nil

p "Changes"
u.changes # {}

p "Assign nil"
u.name = nil
u.age = nil

p "changes should be empty"
u.changes # {}

u.name = 'TEST'
u.age = 30

u.changes # {:name=>[nil, "TEST"], :age=>[nil, 30]}

u.name = 'TEST'
u.age = 30

u.changes # {:name=>[nil, "TEST"], :age=>[nil, 30]}

u.save

u.changes # {}


# u = User.new

# u.name = 'Akhil'
# u.age = 30

# u.changed?
# u.changes

# u.name_was
# u.email_was
# u.age_was

# u.save

# u.changed?
# u.changes


# u.name = 'New name'
# u.age = 31

# u.changes
# u.name_was

# u.name = 'Akhil'
# u.changes
# u.changed?

# u.age = 30
# u.changes

# u.changed?