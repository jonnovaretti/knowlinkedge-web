require 'rails_helper'

RSpec.describe Material, type: :model do
  context 'Material being created' do
    let(:user) { create(:user) }
    let(:study) { create(:study, user: user) }

    it 'is valid should be inserted and a file attached' do
      file = fixture_file_upload('atacama.jpeg', 'image/jpeg')

      material = Material.new(study: study)
      material.file.attach(file)
      material.save

      expect(material.file.attached?).to eq true
      expect(Material.count).to eq 1
    end

    it 'is valid and should be inserted' do
      material = Material.new(study: study)
      material.save

      expect(Material.count).to eq 1
    end

    it 'is not valid without study and should not be inserted' do
      material = Material.new
      material.save

      expect(Material.count).to eq 0
    end
  end
end
