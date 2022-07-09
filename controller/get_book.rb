require_relative 'book_filterer'
require_relative '../helper/book_helper'
require_relative '../helper/json_helper'
include JsonHelper
include BookHelper

module GetBook
  def get_books
    BookFilterer.filter_books(params)
  end

  def get_book_by_id(id)
    book = book_by_id(id)
    halt_if_not_found!(book)
    serialize(book).to_s
  end
end