require_relative '../models/book'
require_relative '../helper/json_helper'
include JsonHelper

module PostBook
  def post_books(json_params)
    book = Book.new(json_params)
    if book.save
      response.headers['Location'] = "#{base_url}/api/v1/books/#{book.id}"
      status 201
    else
      status 422
      body JsonHelper.serialize(book)
    end
  end
end