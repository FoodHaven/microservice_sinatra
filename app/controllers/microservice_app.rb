require 'sinatra'
require 'sinatra/base'

class Microservice < Sinatra::Base
  get '/' do 
    'Hello World'
  end

  get '/markets' do 
  end

  get '/markets/favorites' do 
  end
end