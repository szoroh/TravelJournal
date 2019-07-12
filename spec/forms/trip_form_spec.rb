require 'rails_helper'

RSpec.describe TripForm do
  subject { TripForm.new(arguments) }

  context 'when arguments are corrent' do
      let(:arguments) do
        {
          note: 'aaa',
          user_id: 3
        }
      end

      it 'is valid' do
        expect(subject).to be_valid
      end
    end

  context 'when note is nil' do
    let(:arguments) do
      {
        note: nil,
        user_id: 3
      }
    end

    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when user id is nil' do
    let(:arguments) do
      {
        note: 'aaa',
        user_id: nil
      }
    end

    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end
end
