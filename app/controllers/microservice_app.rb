class Microservice < Sinatra::Base
  require 'sinatra/json'

  get '/' do
    'Hello World'
  end

  get '/markets' do
    markets = Market.all
    serialize(markets)
  end

  get '/markets/search' do
    # Add validation for params here if needed
    search_service = MarketSearchService.new(params)
    markets = search_service.nearby_markets
    serialize(markets)
  end

  get '/markets/favorites' do
    markets = Market.find(params[:market_ids])
    serialize(markets)
  end

  get '/markets/:id' do
    market = Market.find_by(id: params[:id])
    if market
      serialize(market)
    else
      not_found
    end
  end

  not_found do
    json error: 'Resource not found'
  end

  private

  def serialize(object)
    json MarketSerializer.new(object)
  end
end
