# Checking firstname
class NoUpperCaseError < StandardError; end
# No argument error class
class NoFirstName < StandardError; end
# No argument class
class NoLastName < StandardError; end
# Name class
class Name
  attr_reader :firstname, :lastname

  def initialize(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
  end

  def to_s
    "Your name is #{firstname} #{lastname}"
  end
end

begin
  raise NoFirstName if ARGV[0].nil?
  raise NoLastName if ARGV[1].nil?
  raise NoUpperCaseError if ARGV[0][0].upcase != ARGV[0][0]
  user = Name.new(ARGV[0], ARGV[1])
  print user
rescue NoFirstName
  print 'Firstname cannot be blank'
rescue NoLastName
  print 'Lastname cannot be blank'
rescue NoUpperCaseError
  print 'Firstname must start with uppercase letter'
end
