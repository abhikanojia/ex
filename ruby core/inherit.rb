require 'rubygems'
require 'redcloth'

class Formatter
  def initialize(text)
    @text = text
  end
end

class TextileFormatter < Formatter
  def to_html
    RedCloth.new(@text).to_html
  end
end

t = TextileFormatter.new("*strong* coffee(tm)")
puts t.to_html