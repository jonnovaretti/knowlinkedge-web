class HashTag < ApplicationRecord
  has_many :hash_tag_studies

  validates :name, presence: true
  validates :area, presence: true
end
