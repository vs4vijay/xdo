# xDo app server
#
# Auther: vs4vijay@gmail.com

require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'mongoid'
require './models/todo'
# require 'her'

set :public_folder, File.dirname(__FILE__) + '/client'

configure do
  Mongoid.load!("config/mongoid.yml")
end

# use Rack::Auth::Basic do |username, password|
#   username == 'admin' && password == 'admin'
# end

# configure do
#   $db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'viz')
#   # set :mongo_db, db[:viz]
# end

class Xdo < Sinatra::Application

  get '/' do
    send_file 'client/index.html'
  end

  get '/api/v1/todos' do
    @todos = Todo.all.reverse
    # @todos.to_json
    json @todos
  end

  get '/api/v1/todos/search' do
    search_term = params[:term]
    p '-----search term----'
    p search_term
    @todos = Todo.where(text: /#{search_term}/i).reverse
    # @todos.to_json
    json @todos
  end

  post '/api/v1/todos' do
    todo = JSON.parse(request.body.read)
    todo = todo['todo'] unless todo['todo'].nil?
    @todo = Todo.create!(todo)
    json @todo
  end

  put '/api/v1/todos/:id' do
    todo = JSON.parse(request.body.read)
    Todo.find(params[:id]).update!(todo)
    json todo
  end

  get '/create' do
    @todo = Todo.create!(name: 'viz', text: 'My To Do')
    @todo
  end

  error do
    json_status(500, env['sinatra.error'].message)
  end

  # run if ruby file is directly executed
  run! if app_file == $0
end
