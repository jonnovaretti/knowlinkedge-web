require 'rails_helper'

RSpec.describe HashTag, type: :model do
  context 'HashTags being created' do
    it 'with valid params' do
      HashTag.create(name: 'microservices', area: 'Technology')
      expect(HashTag.count).to eq 1
    end

    it 'is not created without name' do
      HashTag.create(name: nil, area: 'Technology')
      expect(HashTag.count).to eq 0
    end

    it 'is not created without params' do
      HashTag.create(name: 'microservices', area: nil)
      expect(HashTag.count).to eq 0
    end
  end
end
