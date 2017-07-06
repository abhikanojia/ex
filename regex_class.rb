class RegexClass
  attr_reader :val
  def initialize(input)
    @val = input
  end

  def regex_replace
    @val.gsub!(/[aeiou]/,'*')
    print @val
  end
end

if ARGV.empty?
  print "Please provide an input"
  exit
else
  str = ARGV.join(' ')
  obj = RegexClass.new(str)
  obj.regex_replace
end