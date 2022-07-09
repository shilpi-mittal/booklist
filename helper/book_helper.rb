require_relative '../models/book'

module BookHelper
  def book(params)
    @book ||= Book.where(id: params[:id]).first
    end

  def book_by_id(id)
    @book ||= Book.where(id: id).first
  end
end