# server.rb
require 'sinatra'
require "sinatra/namespace"
require 'mongoid'
require_relative 'models/book'
require_relative 'controller/get_book'
require_relative 'controller/post_book'
include GetBook
include PostBook
# require 'pry'

# DB Setup
Mongoid.load! "mongoid.config"

# set :static, true
# set :public_dir, '/'

# Endpoints
get '/' do
  'Welcome to BookList!'
end

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/html' do
    File.read('index.html')
  end

  get '/files' do
    file_to_send_to_front = "index.html"
    send_file file_to_send_to_front, :filename => "index.html", :type => 'application/octet-stream'

    # headers['Content-Disposition'] = "attachment"
    # send_file(File.read('index.html'))
  end

  get '/all_books' do
    Book.all.to_json
  end

  get '/books' do
    get_books
  end

  get '/books/:id' do |id|
    get_book_by_id(id)
  end

  post '/books' do
    post_books(json_params)
  end

end
