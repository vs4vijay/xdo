# xDo app server
#
# Auther: vs4vijay@gmail.com

require 'sinatra'
require 'sinatra/base'
require 'her'
require 'mongoid'

# require 'mongo'
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

# Mongoid.load!("config/mongoid.yml", :development)
#
# Mongoid.database = Mongo::Connection.new('localhost').db('viz')

# Mongoid.database = Mongo::Connection.new(host, port).db(db)
# Mongoid.database.authenticate(user, pass)

# Mongoid.configure do |config|
#   name = 'tododb'
#   host = 'localhost'
#   config.master = Mongo::Connection.new.db(name)
#   config.logger = logger
#   config.persist_in_safe_mode = false
# end

configure do
  Mongoid.configure do |config|
    config.sessions = {
      :default => {
        :hosts => ["localhost:27017"],
        :database => "viz"
      }
    }
  end
end

class ToDo
  include Mongoid::Document
  #include Her::Model

  field :name, type: String
  field :text, type: String
end

class XDo < Sinatra::Application

  get '/' do
    send_file 'client/index.html'
  end

  get '/c' do
    @todo = ToDo.new(name: "name viz")
    @todo
  end

  get '/api/todo' do
    {:name => 'viz', :text => 'No viz'}
  end

  # run if ruby file is directly executed
  run! if app_file == $0
end
