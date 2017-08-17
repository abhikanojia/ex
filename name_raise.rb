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
    validate_name(firstname, lastname)
    @firstname = firstname
    @lastname = lastname
  end

  def to_s
    "Your name is #{firstname} #{lastname}"
  end

  private

  def validate_name(firstname, lastname)
    begin
      raise NoFirstName if firstname.nil?
      raise NoLastName if lastname.nil?
      raise NoUpperCaseError if firstname[0].upcase != firstname[0]
    rescue NoFirstName
      print 'Firstname cannot be blank'
      exit
    rescue NoLastName
      'Lastname cannot be blank'
      exit
    rescue NoUpperCaseError
      'Firstname must start with uppercase letter'
      exit
    end
  end
end

user = Name.new(ARGV[0], ARGV[1])
print user

