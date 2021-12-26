require 'rails_helper'

RSpec.describe 'StudiesController', type: :request do
  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id) }

    context 'with valid params' do
      it 'creates a new Study' do
        expect do
          post '/api/v1/studies', headers: { 'Authorization': "Bearer #{token.token}" },
                                  params: { study: { title: 'Title test',
                                                     area: 'Technology',
                                                     brief: 'How to migrate from monolith to microservices',
                                                     hash_tags: 'archicture, microservices' } }

          expect(response).to have_http_status(:created)
          expect(response.body).to include('id')
        end.to change(Study, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'not create a new Study' do
        expect do
          post '/api/v1/studies', headers: { 'Authorization': "Bearer #{token.token}" },
                                  params: { study: { title: nil,
                                                     area: nil,
                                                     hash_tags: 'archicture, microservices' } }

          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include('messages')
        end.to change(Study, :count).by(0)
      end
    end
  end
end
