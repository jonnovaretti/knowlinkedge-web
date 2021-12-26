require 'rails_helper'

RSpec.describe 'MaterialsController', type: :request do
  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id) }
    let(:study) { create :study, id: 77, user: user }

    context 'with valid params' do
      it 'creates a new Material' do
        expect do
          file = fixture_file_upload('atacama.jpeg', 'image/jpeg')
          post '/api/v1/materials', headers: { 'Authorization': "Bearer #{token.token}" },
                                    params: { material: { file: file, study_id: study.id } }

          expect(response).to have_http_status(:created)
          expect(response.body).to include('id')
        end.to change(Study, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'did not find study and does not create a new Material
        and return internal server error' do
        expect do
          file = fixture_file_upload('atacama.jpeg', 'image/jpeg')
          post '/api/v1/materials', headers: { 'Authorization': "Bearer #{token.token}" },
                                    params: { material: { file: file, study_id: 33 } }

          expect(response).to have_http_status(:not_found)
          expect(response.body).to include('message')
        end.to change(Study, :count).by(0)
      end
    end
  end
end
