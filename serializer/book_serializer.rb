# require 'pry'

class BookSerializer
  def initialize(book)
    @book = book
  end

  def to_json
    data = {
      id:@book.id.to_s,
      title:@book.title,
      author:@book.author,
      isbn:@book.isbn
    }
    data[:errors] = @book.errors if@book.errors.any?
    # binding.pry
    data
  end
end