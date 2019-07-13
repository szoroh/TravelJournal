require 'rails_helper'

RSpec.describe TripForm do
  subject { TripForm.new(arguments) }

  let(:arguments) do
    {
      note: 'aaa',
      user_id: 1,
      city_name: 'Warsaw'
    }
  end

  context 'when arguments are correct' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when note is nil' do
    it 'is invalid' do
      subject.note = nil
      expect(subject).to be_invalid
    end
  end

  context 'when user id is nil' do
    it 'is invalid' do
      subject.user_id = nil
      expect(subject).to be_invalid
    end
  end

  context 'when city name is nil' do
    it 'is invalid' do
      subject.city_name = nil
      expect(subject).to be_invalid
    end
  end
end
