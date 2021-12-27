class Comment < ApplicationRecord
  belongs_to :study
  belongs_to :material, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :text, presence: true
  validates :mterial, presence: false

  def references_to(material)
    self.material = material
  end
end
