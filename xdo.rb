# xDo app server
#
# Auther: vs4vijay@gmail.com

require 'sinatra'
require 'sinatra/base'
require 'her'
#require 'mongoid'

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

class ToDo
  #include Her::Model
  include Her::JsonApi::Model
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
