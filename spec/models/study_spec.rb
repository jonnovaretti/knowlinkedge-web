require 'rails_helper'

RSpec.describe Study, type: :model do
  context 'Study being created' do
    let(:user) { FactoryBot.create(:user) }

    it 'is valid params and should be inserted' do
      Study.create(user: user, title: 'Title new', area: 'Technology',
                   brief: 'Small brief')

      expect(Study.count).to eq 1
    end

    it 'with valid params but brief and should be inserted' do
      Study.create(user: user, title: 'Title new', area: 'Technology')
      expect(Study.count).to eq 1
    end

    it 'with valid params and hash tags and should be inserted' do
      area = 'Technology'
      hash_tags = []
      hash_tags << HashTag.create(name: 'microservices', area: area)
      hash_tags << HashTag.create(name: 'migration', area: area)

      Study.create(user: user, title: 'Title new', area: area,
                   brief: 'Small brief', hash_tags: hash_tags)

      expect(Study.count).to eq 1
    end

    it 'is not create without user and should not be inserted' do
      Study.create(title: 'Title new', area: 'Technology', brief: 'Small brief')
      expect(Study.count).to eq 0
    end

    it 'is not create without title and should not be inserted' do
      Study.create(user: user, area: 'Technology', brief: 'Small brief')
      expect(Study.count).to eq 0
    end

    it 'is not create without area and should not be inserted' do
      Study.create(user: user, title: 'Title new', area: nil, brief: 'Small brief')
      expect(Study.count).to eq 0
    end
  end
end
