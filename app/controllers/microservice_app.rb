require 'sinatra'
require 'sinatra/json'

class Microservice < Sinatra::Base
  get '/' do 
    json 'Hello World'
  end

  get '/markets' do 
    
  end

  get '/markets/search' do 

  end

  get '/markets/favorites' do 

  end
end