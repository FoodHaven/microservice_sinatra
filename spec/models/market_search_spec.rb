require 'spec_helper'

RSpec.describe MarketSearchService do
  describe '#nearby_markets' do
    it 'returns markets within the specified radius' do
      market_1 = create(:market, longitude: -81.1478018, latitude: 36.1582212)
      market_2 = create(:market, longitude: -81.2843197, latitude: 35.6741832)
      market_3 = create(:market, longitude: -117.90522, latitude: 48.543279)
      market_4 = create(:market, longitude: -80.3862664534582, latitude: 33.97372952277976)
      market_5 = create(:market, longitude: -73.686043, latitude: 40.983895)
      location_params = { latitude: 34.60, longitude: -80.34, radius: 50 }
      search_service = MarketSearchService.new(location_params)
      result = search_service.nearby_markets
      expect(result.to_a).to eq([market_4])
    end
  end
end


