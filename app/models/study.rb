# frozen_string_literal: true

class Study < ApplicationRecord
  belongs_to :user
  has_many :hash_tag_studies
  has_many :hash_tags, through: :hash_tag_studies

  validates :title, presence: true
  validates :area, presence: true
end
