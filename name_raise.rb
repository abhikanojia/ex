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
    raise NoFirstName if firstname.nil?
    raise NoLastName if lastname.nil?
    raise NoUpperCaseError if firstname[0].upcase != firstname[0]
    @firstname = firstname
    @lastname = lastname
  end

  def to_s
    "Your name is #{firstname} #{lastname}"
  end
end

begin
  user = Name.new(ARGV[0], ARGV[1])
  print user
rescue NoFirstName
  print 'Firstname cannot be blank'
rescue NoLastName
  print 'Lastname cannot be blank'
rescue NoUpperCaseError
  print 'Firstname must start with uppercase letter'
end
