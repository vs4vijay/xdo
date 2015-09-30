# xDo app server
#
# Auther: vs4vijay@gmail.com

require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'her'
# gem 'mongoid', '4.0.0'
require 'mongoid'
require 'mongo'
# include Mongo

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
  puts 'connecting'
  Mongoid.load!("config/mongoid.yml")
end


# Mongoid.database = Mongo::Connection.new('localhost').db('viz')

# Mongoid.configure do |config|
#   config.clients = {
#     :default => {
#       :hosts => ["localhost:27017"],
#       :database => "viz"
#     }
#   }
#   config.connect_to("viz")
# end


# Mongoid.configure do |config|
#   name = 'viz'
#   host = 'localhost'
#   config.master = Mongo::Connection.new.db(name)
#   config.logger = logger
#   config.persist_in_safe_mode = false
# end


# configure do
#   Mongoid.configure do |config|
#     config.clients = {
#       :default => {
#         :hosts => ["localhost:27017"],
#         :database => "viz"
#       }
#     }
#   end
# end


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

    Todo.all

    # $db[:todos].insert_one({name: 'data'})

    send_file 'client/index.html'
  end

  get '/c' do
    Todo.all

    @todo = Todo.create!(name: "name viz")
    @todo
  end

  get '/api/todos' do
    {:name => 'viz', :text => 'No viz'}
  end

  # run if ruby file is directly executed
  run! if app_file == $0
end
