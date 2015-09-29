require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/client'

get '/' do
  send_file 'client/index.html'
end

get '/hi' do
  'Hello Viz'
end
