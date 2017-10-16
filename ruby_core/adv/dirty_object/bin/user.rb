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

u.changes # {}

u.name = nil
u.age = nil

u.changes # {}

u.name = 'TEST'
u.age = 30

u.changes # {:name=>[nil, "TEST"], :age=>[nil, 30]}



u.name = 'TEST'
u.age = 303



u.changes # {:name=>[nil, "TEST"], :age=>[nil, 30]}

u.save

u.changes # {}
