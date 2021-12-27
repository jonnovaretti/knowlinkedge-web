require 'rails_helper'

RSpec.describe UseCases::CreateMaterialUseCase, type: :model do
  describe '.execute' do
    context 'with valid params' do
      let(:user) { create :user }
      let(:study) { create :study, user: user }
      let(:reference) { create :reference }

      it 'creates material' do
        pdf_file = fixture_file_upload('sample.pdf', 'application/pdf')
        use_case = UseCases::CreateMaterialUseCase.new
        params = { file: pdf_file, study_id: study.id }

        use_case.execute(user, params)

        expect(Material.count).to eq 1
      end

      it 'creates material with reference' do
        pdf_file = fixture_file_upload('sample.pdf', 'application/pdf')
        use_case = UseCases::CreateMaterialUseCase.new
        params = { file: pdf_file, study_id: study.id, references: [{
          title: 'Monolith to microservice',
          authors: 'Sam Newton',
          link: 'htttp://oreilly.com/books/monolith-to-microservices'
        }] }

        use_case.execute(user, params)

        expect(Material.count).to eq 1
        expect(Reference.count).to eq 1
      end

      it 'creates material with two references' do
        pdf_file = fixture_file_upload('sample.pdf', 'application/pdf')
        use_case = UseCases::CreateMaterialUseCase.new
        params = { file: pdf_file, study_id: study.id, references: [{
          title: 'Monolith to microservice',
          authors: 'Sam Newton',
          link: 'htttp://oreilly.com/books/monolith-to-microservices'
        }, {
          title: reference.title,
          authors: reference.authors,
          link: 'htttp://oreilly.com/books/building-microservices'
        }] }

        use_case.execute(user, params)

        reference_found = Reference.find(reference.id)

        expect(Material.count).to eq 1
        expect(reference_found).to_not be_nil
      end
    end
  end
end
