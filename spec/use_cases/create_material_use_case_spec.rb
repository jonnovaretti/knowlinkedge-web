require 'rails_helper'

RSpec.describe UseCases::CreateMaterialUseCase, type: :model do
  context 'Material being created' do
    let(:user) { create :user }
    let(:study) { create :study, user: user }

    it 'with valid params' do
      pdf_file = fixture_file_upload('sample.pdf', 'application/pdf')
      use_case = UseCases::CreateMaterialUseCase.new
      params = { file: pdf_file, study_id: study.id }
      use_case.execute(user, params)

      expect(Material.count).to eq 1
    end
  end
end
