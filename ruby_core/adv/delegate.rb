require 'forwardable'

class Book
  def language
    "English"
  end

  def year
    "1926"
  end

  def author
    "Ernest Hemingway"
  end

  def title
    "The Sun Also Rises"
  end
end

class Product
  extend Forwardable

  def_delegators :@book, :language, :year, :author
    def_delegator :@book, :title, :info

  def initialize
    @book = Book.new
  end
end

p = Product.new
p p.info
p p.year
