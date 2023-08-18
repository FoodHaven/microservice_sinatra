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
    markets = Market.nearby_markets(params)
    json MarketSerializer.new(markets)
  end
  
  get '/markets/favorites' do 
    require 'pry'; binding.pry
  end
end