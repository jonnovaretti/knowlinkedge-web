require 'rails_helper'

RSpec.describe HashTag, type: :model do
  describe '.create' do
    context 'with valid params' do
      it 'insert with all params' do
        HashTag.create(name: 'microservices', area: 'Technology')
        expect(HashTag.count).to eq 1
      end
    end

    context 'with invalid params' do
      it 'not insert without name' do
        HashTag.create(name: nil, area: 'Technology')
        expect(HashTag.count).to eq 0
      end

      it 'not insert without area' do
        HashTag.create(name: 'microservices', area: nil)
        expect(HashTag.count).to eq 0
      end
    end
  end
end
