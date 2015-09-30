# xDo app server
#
# Auther: vs4vijay@gmail.com

require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'mongoid'
require 'her'

set :public_folder, File.dirname(__FILE__) + '/client'

# use Rack::Auth::Basic do |username, password|
#   username == 'admin' && password == 'admin'
# end

# Her::API.setup url: "https://api.example.com" do |c|
#   # Request
#   c.use Faraday::Request::UrlEncoded
#
#   # Response
#   c.use Her::Middleware::DefaultParseJSON
#
#   # Adapter
#   c.use Faraday::Adapter::NetHttp
# end


configure do
  Mongoid.load!("config/mongoid.yml")
end


# configure do
#   $db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'viz')
#   # set :mongo_db, db[:viz]
# end


class Todo
  include Mongoid::Document
  #include Her::Model

  field :name, type: String
  field :text, type: String
end

class XDo < Sinatra::Application

  get '/' do
    todos = Todo.all
    send_file 'client/index.html'
  end

  get '/create' do
    Todo.all

    @todo = Todo.create!(name: "viz")
    @todo
  end

  get '/api/v1/todos' do
    @todos = Todo.all
    @todos.to_json
  end

  # run if ruby file is directly executed
  run! if app_file == $0
end
