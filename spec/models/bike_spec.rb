require 'rails_helper'

RSpec.describe Bike, type: :model do
  describe '#price' do
    it 'saves and retrieves the value correctly (sanity check)' do
      value = 23.45
      bike = FactoryGirl.create(:bike, price: value)
      expect(bike.price).to eq(value)
    end
  end
end
