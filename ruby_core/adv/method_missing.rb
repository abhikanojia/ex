class Book
  def initialize(title, author)
    @title = title
    @author = author
  end

  private
  def method_missing(name, *args)
    instance_eval do
      eval "@#{name}"
    end
  end
end

b = Book.new("The Intelligent Investor", "Benjamin Graham")
p b.title # => "The Intelligent Investor"
p b.author # => "Benjamin Graham"