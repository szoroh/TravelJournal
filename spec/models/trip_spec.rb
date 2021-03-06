require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:user) { create(:user) }
  let(:city) { create(:city, trip: trip) }
  let(:trip) { create(:trip, user: user) }
  let(:weather) { create(:weather, trip: trip) }

  describe 'new trip' do
    context 'with correct params' do
      it 'is valid' do
        expect(trip).to be_valid
      end
    end

    context 'with too long note' do
      it 'is invalid' do
        trip.note = 'a' * 601
        expect(trip).to be_invalid
      end
    end
  end
end
