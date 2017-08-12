# Public- Method for characters count
class String
  def characters_count
    each_char do |char|
      if ('a'..'z').cover?(char)
        lower += 1
      elsif ('A'..'Z').cover?(char)
        upper += 1
      elsif ('0'..'9').cover?(char)
        numeric += 1
      end
    end
    _print(lower, upper, numeric)
  end

  private

  def _print(lower, upper, numeric)
    "Lowercase characters = #{lower}\n" \
    "Uppercase characters = #{upper}\n" \
    "Numeric characters = #{numeric}\n" \
    "Special characters = #{length - (lower + upper + numeric)}"
  end
end

if ARGV[0].nil?
  print 'Please provide an input'
  exit
else
  print ARGV[0].characters_count
end
