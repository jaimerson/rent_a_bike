require 'rails_helper'

shared_examples 'a bikes report approach' do
  subject(:approach) { described_class.new }

  describe '#to_a' do
    let(:cheap_bike) { create(:bike, price: 3.14) }
    let(:expensive_bike) { create(:bike, price: 210) }

    let!(:cheap_rentals) do
      create_list(:rental, 2, bike: cheap_bike,
                  created_at: Time.current - interval.hours,
                  returned_at: Time.current)
    end

    let!(:expensive_rental) do
      create(:rental, bike: expensive_bike,
            created_at: Time.current - interval.hours,
            returned_at: Time.current)
    end

    let(:interval) { 24 }

    let(:expected) do
      [
        {
          name: cheap_bike.name, model: cheap_bike.model,
          times_rented: 2, revenue: cheap_bike.price * interval * 2
        },
        {
          name: expensive_bike.name, model: expensive_bike.model,
          times_rented: 1, revenue: expensive_bike.price * interval
        }
      ]
    end

    it 'presents the right information' do
      BikesReport.refresh
      expect(approach.to_a).to eq(expected)
    end
  end
end
