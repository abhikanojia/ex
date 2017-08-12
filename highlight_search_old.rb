# Public - Class for highlighting given search string
class HighlightSearch
  attr_accessor :string, :search_string

  def initialize(string, search_string)
    @search_string = search_string.to_s
    @string = string
  end

  def match
    @string.gsub(/(?i)#{search_string}/) { |matched| '(' + matched + ')' }
  end

  def count_match
    @string.scan(/#{search_string}/i).length
  end
end

if ARGV[0].nil? || ARGV[1].nil?
  print 'Please provide an input'
  exit
else
  obj = HighlightSearch.new(ARGV[0], ARGV[1])
  print obj.match
  print "\nTotal occurrences found: #{obj.count_match}"
end
