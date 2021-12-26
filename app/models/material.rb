class Material < ApplicationRecord
  belongs_to :study
  has_one_attached :file
  validates :type, presence: true

  after_initialize :set_init_attributes

  MATERIAL_TYPE = {
    mind_map: 'Mind Map',
    text: 'Text',
    diagram: 'Diagram'
  }.freeze

  def set_init_attributes
    self.type = MATERIAL_TYPE[:mind_map]
  end
end
