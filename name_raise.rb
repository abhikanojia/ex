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
    validate
  end

  def to_s
    "Your name is #{firstname} #{lastname}"
  end

  private

  def first_uppercase?(firstname)
    firstname[0].upcase != firstname[0]
  end

  def validate
    begin
      raise NoFirstName if @firstname.empty? || @firstname.nil?
      raise NoLastName if @lastname.empty? || @lastname.nil?
      raise NoUpperCaseError if first_uppercase? @firstname
    rescue NoFirstName
      print 'Firstname cannot be blank'
      exit
    rescue NoLastName
      print 'Lastname cannot be blank'
      exit
    rescue NoUpperCaseError
      print 'Firstname must start with uppercase letter'
      exit
    end
  end
end

print Name.new(ARGV[0].to_s, ARGV[1].to_s)