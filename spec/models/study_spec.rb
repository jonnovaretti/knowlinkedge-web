require 'rails_helper'

RSpec.describe Study, type: :model do
  context 'Study being created' do
    let(:user) { FactoryBot.create(:user) }

    it 'with valid params' do
      Study.create(user: user, title: 'Title new', area: 'Technology',
                   brief: 'Small brief')
      expect(Study.count).to eq 1
    end

    it 'with valid params but brief' do
      Study.create(user: user, title: 'Title new', area: 'Technology')
      expect(Study.count).to eq 1
    end

    it 'with valid params and hash tags' do
      area = 'Technology'
      hash_tags = []
      hash_tags << HashTag.create(name: 'microservices', area: area)
      hash_tags << HashTag.create(name: 'migration', area: area)

      Study.create(user: user, title: 'Title new', area: area,
                   brief: 'Small brief', hash_tags: hash_tags)

      expect(Study.count).to eq 1
    end

    it 'is not create without user' do
      Study.create(title: 'Title new', area: 'Technology', brief: 'Small brief')
      expect(Study.count).to eq 0
    end

    it 'is not create without title' do
      Study.create(user: user, area: 'Technology', brief: 'Small brief')
      expect(Study.count).to eq 0
    end

    it 'is not create without area' do
      Study.create(user: user, title: 'Title new', area: nil, brief: 'Small brief')
      expect(Study.count).to eq 0
    end
  end
end
