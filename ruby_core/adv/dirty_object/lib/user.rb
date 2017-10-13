# require dirty object
require_relative '../bin/dirtyobject.rb'
# User class includes dirty object
class User
  include Dirty
  attr_accessor :name, :age, :email
  dirty_attributes :name, :age
end

u = User.new

u.name = 'Akhil'
u.age = 30

u.changed?
u.changes

u.name_was
u.email_was
u.age_was

u.save

u.changed?
u.changes


u.name = 'New name'
u.age = 31

u.changes
u.name_was

u.name = 'Akhil'
u.changes
u.changed?

u.age = 30
u.changes

u.changed?