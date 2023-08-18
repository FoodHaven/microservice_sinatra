require 'sinatra'
require 'sinatra/contrib'

class Microservice < Sinatra::Base

  get '/hello' do 
    'Hello World'
  end

  get '/markets' do 
    markets = Market.all
    json MarketSerializer.new(markets)
  end

  get '/markets/search' do 
    require 'pry'; binding.pry
  end

  get '/markets/favorites' do 
  end
end