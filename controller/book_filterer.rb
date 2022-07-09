require_relative '../serializer/book_serializer'

# module Controller
module BookFilterer
  def self.filter_books(params)
    books = Book.all

    [:title, :isbn, :author].each do |filter|
      books = books.send(filter, params[filter]) if params[filter]
    end

    # books.to_json
    books.map { |book| serialize(book) }.to_s
  end
end
# end