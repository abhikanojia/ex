class String
  def palindrome?
    self == reverse
  end
end

puts ARGV[0].palindrome? ? "test" : "no"
