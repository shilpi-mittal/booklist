require_relative '../serializer/book_serializer'
include BookHelper
require 'pry'

module JsonHelper
  def base_url
    @base_url ||= "#{request.env['rack.url_scheme']}://localhost:4567"
  end

  def json_params
    begin
      JSON.parse(request.body.read)
    rescue
      halt 400, { message:'Invalid JSON' }.to_json
    end
  end

  def halt_if_not_found!(book)
    halt(404, { message: 'Book Not Found'}.to_json) unless book
    # binding.pry
  end

  def serialize(book)
    # binding.pry
    BookSerializer.new(book).to_json
  end
end