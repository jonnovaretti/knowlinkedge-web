require 'rails_helper'

RSpec.describe Study, type: :model do
  describe '.create' do
    let(:user) { FactoryBot.create(:user) }

    context 'with valid params' do
      it 'inserts with all attributes' do
        Study.create(user: user, title: 'Title new', area: 'Technology',
                     brief: 'Small brief')

        expect(Study.count).to eq 1
      end

      it 'inserts without brief' do
        Study.create(user: user, title: 'Title new', area: 'Technology')
        expect(Study.count).to eq 1
      end

      it 'insert with all params and hash tags' do
        area = 'Technology'
        hash_tags = []
        hash_tags << HashTag.create(name: 'microservices', area: area)
        hash_tags << HashTag.create(name: 'migration', area: area)

        Study.create(user: user, title: 'Title new', area: area,
                     brief: 'Small brief', hash_tags: hash_tags)

        expect(Study.count).to eq 1
      end
    end

    context 'with invalid params' do
      it 'not insert without user' do
        Study.create(title: 'Title new', area: 'Technology', brief: 'Small brief')
        expect(Study.count).to eq 0
      end

      it 'not insert without title' do
        Study.create(user: user, area: 'Technology', brief: 'Small brief')
        expect(Study.count).to eq 0
      end

      it 'not insert without area' do
        Study.create(user: user, title: 'Title new', area: nil, brief: 'Small brief')
        expect(Study.count).to eq 0
      end
    end
  end
end
