require './spec/spec_helper.rb'

RSpec.describe 'Markets', type: :request do
  before(:each) do
    @market_1_id = create(:market).id
    @market_2_id = create(:market).id
    @market_3_id = create(:market).id
    @market_4_id = create(:market).id
    @market_5_id = create(:market).id
  end

  describe 'find favorites by id' do
    it 'hits the endpoint' do 
      query_params = {
        market_ids: [@market_1_id, @market_2_id, @market_4_id ]
      }

      get 'markets/favorites', query_params

      expect(last_response).to be_successful
    end

    it 'returns the correct json objects' do 
      query_params = {
        market_ids: [@market_1_id, @market_2_id, @market_4_id ]
      }

      get 'markets/favorites', query_params

      markets = JSON.parse(last_response.body, symbolize_names: true)[:data]
      
      markets.each do |market|
        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a(String)
        
        expect(market[:attributes]).to have_key(:address)
        expect(market[:attributes][:address]).to be_a(String)

        expect(market[:attributes]).to have_key(:site)
        expect(market[:attributes][:site]).to be_a(String)

        expect(market[:attributes]).to have_key(:description)
        expect(market[:attributes][:description]).to be_a(String)

        expect(market[:attributes]).to have_key(:fnap)
        expect(market[:attributes][:fnap]).to be_a(String)

        expect(market[:attributes]).to have_key(:snap_option)
        expect(market[:attributes][:snap_option]).to be_a(String)

        expect(market[:attributes]).to have_key(:accepted_payment)
        expect(market[:attributes][:accepted_payment]).to be_a(String)

        expect(market[:attributes]).to have_key(:longitude)
        expect(market[:attributes][:longitude]).to be_an(Float)

        expect(market[:attributes]).to have_key(:latitude)
        expect(market[:attributes][:latitude]).to be_an(Float)
      end

      market_ids = markets.map { |market| market[:attributes][:id] }

      expect(markets.count == 3).to be true
      expect(market_ids).to_not include(@market_3_id, @market_5_id)
    end
  end
end