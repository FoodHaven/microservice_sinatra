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
    end
  end
end
