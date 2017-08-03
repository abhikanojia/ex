# highlight search
class String
  def highlight_search(search_string)
    count = 0
    string = dup
    string.gsub!(/(?i)#{ search_string }/) do |matched|
      count += 1
      '(' + matched + ')'
    end
    [string, count]
  end
end

if ARGV.first.nil? || ARGV[1].nil?
  print 'Please provide an input'
else
  highlighted_string, occurence_count = ARGV.first.highlight_search(ARGV[1])
  print highlighted_string
  print "\nTotal occurrences found: #{ occurence_count }"
end
