class Study < ApplicationRecord
  belongs_to :user
  has_many :hash_tag_studies
  has_many :hash_tags, through: :hash_tag_studies

  validates :title, presence: true
  validates :area, presence: true
  validates :status, presence: true
  after_initialize :set_init_attributes

  STUDY_STATUS = { in_progress: 'In Progress',
                   finalized: 'Finalized' }.freeze

  def set_init_attributes
    self.status = STUDY_STATUS[:in_progress]
  end

  def belongs_to?(user)
    self.user.id == user.id
  end
end
