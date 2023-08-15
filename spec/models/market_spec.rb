require 'spec_helper'

RSpec.describe Market, type: :model do
  describe 'class methods' do 
    describe 'benefits' do 
      before(:each) do 
        create(:market, fnap: nil)
        create(:market, snap_option: nil)
        create(:market, fnap: nil, snap_option: nil)
        create(:market, fnap: nil, snap_option: nil)
        create(:market, snap_option: 'accepts')
        create(:market, snap_option: 'accepts', fnap: 'accepts')
      end

      it '::accepts_benefits' do 
        result = Market.accepts_benefits
        expect(result.count).to eq(4) 
      end

      it '::snap_available' do 
        result = Market.snap_available
        expect(result.count).to eq(3)
      end

      it '::fnap_available' do 
        result = Market.fnap_available
        expect(result.count).to eq(3)
      end

      it '::haversine' do 
        start_coords = {
          latitude: 34.60465, 
          longitude: -80.34465
        }
        end_coords = {
          latitude: 43.59465, 
          longitude: -67.45465
        }
        result = Market
        .haversine(start_coords, end_coords)
        expect(result).to eq(927.2636808622536)
      end

      it '::radians' do 
        result = radians(34.6)

        expect(result).to eq(0.6038839211900381)
      end
    end

    describe 'instance methods' do 
      it '#market_coordinates' do 
        market = create(:market, latitude: 36.1582212, longitude: -81.1478018)
        result = market.market_coordinates
        expect(result).to eq({:latitude=>36.1582212, :longitude=>-81.1478018}) 
      end
    end

    describe 'proximity' do 
      it '::nearby_markets' do 
        market_1 = create(:market, longitude: -81.1478018, latitude: 36.1582212)
        market_2 = create(:market, longitude: -81.2843197, latitude: 35.6741832)
        market_3 = create(:market, longitude: -117.90522, latitude: 48.543279)
        market_4 = create(:market, longitude: -80.3862664534582, latitude: 33.97372952277976)
        market_5 = create(:market, longitude: -73.686043, latitude: 40.983895)
        result = Market.nearby_markets({latitude: 34.60, longitude: -80.34, radius: 50})
        expect(result.to_a).to eq([market_4])
      end
    end
  end
end
