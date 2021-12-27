require 'rails_helper'

RSpec.describe 'MaterialsController', type: :request do
  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id) }
    let(:study) { create :study, id: 77, user: user }
    let(:reference) { create :reference }

    context 'with valid params' do
      it 'creates a new Material' do
        expect do
          file = fixture_file_upload('atacama.jpeg', 'image/jpeg')
          post '/api/v1/materials', headers: { 'Authorization': "Bearer #{token.token}" },
                                    params: { material: { file: file, study_id: study.id } }

          expect(response).to have_http_status(:created)
          expect(response.body).to include('id')
        end.to change(Material, :count).by(1)
      end

      it 'creates material with reference' do
        file = fixture_file_upload('atacama.jpeg', 'image/jpeg')
        post '/api/v1/materials', headers: { 'Authorization': "Bearer #{token.token}" },
                                  params: { material: { file: file, study_id: study.id, references: [{
                                    title: 'Monolith to microservice',
                                    authors: 'Sam Newton',
                                    link: 'htttp://oreilly.com/books/monolith-to-microservices'
                                  }] } }

        expect(response).to have_http_status(:created)
        expect(response.body).to include('id')
        expect(Material.count).to eq 1
        expect(Reference.count).to eq 1
      end

      it 'creates material with two references' do
        file = fixture_file_upload('atacama.jpeg', 'image/jpeg')
        post '/api/v1/materials', headers: { 'Authorization': "Bearer #{token.token}" },
                                  params: { material: { file: file, study_id: study.id, references: [{
                                    title: 'Monolith to microservice',
                                    authors: 'Sam Newton',
                                    link: 'htttp://oreilly.com/books/monolith-to-microservices'
                                  }, {
                                    title: reference.title,
                                    authors: reference.authors,
                                    link: 'htttp://oreilly.com/books/building-microservices'
                                  }] } }

        material = Material.last

        expect(Material.count).to eq 1
        expect(material.references.count).to eq 2
      end
    end

    context 'with invalid params' do
      it 'return internal server error when study has not found' do
        expect do
          file = fixture_file_upload('atacama.jpeg', 'image/jpeg')
          post '/api/v1/materials', headers: { 'Authorization': "Bearer #{token.token}" },
                                    params: { material: { file: file, study_id: 33 } }

          expect(response).to have_http_status(:not_found)
          expect(response.body).to include('message')
        end.to change(Material, :count).by(0)
      end
    end
  end
end
