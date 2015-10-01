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
  include Mongoid::Timestamps
  #include Mongoid::Attributes::Dynamic
  #include Her::Model

  #field :_id, type: String, default: ->{ name }
  field :name, type: String
  field :text, type: String
  field :done, type: Boolean, default: false
end

class XDo < Sinatra::Application

  get '/' do
    send_file 'client/index.html'
  end

  get '/create' do
    @todo = Todo.create!(name: 'viz', text: 'My To Do')
    @todo
  end

  get '/api/v1/todos' do
    @todos = Todo.all
    @todos.to_json
  end

  post '/api/v1/todos' do
    todo = JSON.parse(request.body.read)
    todo = Todo.create!(todo)
    todo.to_json
  end

  put '/api/v1/todos/:id' do
    todo = JSON.parse(request.body.read)
    todo = Todo.find(params[:id]).update!(todo)
    todo.to_json
  end

  error do
    json_status(500, env['sinatra.error'].message)
  end

  # run if ruby file is directly executed
  run! if app_file == $0
end
