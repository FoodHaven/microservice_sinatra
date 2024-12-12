require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib'

class Microservice < Sinatra::Base
  
  get '/' do 
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
    markets = Market.find(params[:market_ids])
    json MarketSerializer.new(markets)
  end
  
  get '/markets/:id' do 
    market = Market.find(params[:id])
    json MarketSerializer.new(market)
  end
end