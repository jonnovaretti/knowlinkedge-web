require 'rails_helper'

RSpec.describe 'CommentsController', type: :request do
  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:token) { FactoryBot.create(:access_token, resource_owner_id: user.id) }
    let(:study) { create :study, id: 77, user: user }
    let(:material) { create :material, study: study }

    context 'with valid params' do
      it 'creates a new Comment without material' do
        expect do
          post '/api/v1/comments', headers: { 'Authorization': "Bearer #{token.token}" },
                                   params: { comment: { text: 'Any comment', study_id: study.id } }

          comment = Comment.last

          expect(response).to have_http_status(:created)
          expect(response.body).to include('id')
          expect(comment.material).to be_nil
        end.to change(Comment, :count).by(1)
      end

      it 'creates a new Comment with material' do
        expect do
          post '/api/v1/comments', headers: { 'Authorization': "Bearer #{token.token}" },
                                   params: { comment: { text: 'Any comment', material_id: material.id,
                                                        study_id: study.id, has_reference: 'true' } }

          comment = Comment.last

          expect(response).to have_http_status(:created)
          expect(response.body).to include('id')
          expect(comment.material).to_not be_nil
        end.to change(Comment, :count).by(1)
      end
    end
  end
end
