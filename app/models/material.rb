class Material < ApplicationRecord
  belongs_to :study
  has_one_attached :file
  has_many :material_references
  has_many :references, through: :material_references

  validates :material_type, presence: true

  after_initialize :set_init_attributes

  MATERIAL_TYPE = {
    mind_map: 'Mind Map',
    text: 'Text',
    diagram: 'Diagram',
    other: 'Other'
  }.freeze

  def set_init_attributes
    self.material_type = MATERIAL_TYPE[:other]
  end

  def belongs_to?(study)
    self.study.id == study.id
  end

  def add_references(references)
    return if references.nil?

    self.references = references
  end
end
