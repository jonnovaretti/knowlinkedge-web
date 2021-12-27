require 'rails_helper'

RSpec.describe Material, type: :model do
  describe '.create' do
    let(:user) { create(:user) }
    let(:study) { create(:study, user: user) }
    context 'with valid params' do
      it 'inserts with all params and new file' do
        file = fixture_file_upload('atacama.jpeg', 'image/jpeg')

        material = Material.new(study: study)
        material.file.attach(file)
        material.save

        expect(material.file.attached?).to eq true
        expect(Material.count).to eq 1
      end

      it 'inserts with all params but file' do
        material = Material.new(study: study)
        material.save

        expect(Material.count).to eq 1
      end
    end
    context 'with invalid params' do
      it 'not insert without study' do
        material = Material.new
        material.save

        expect(Material.count).to eq 0
      end
    end
  end
end
