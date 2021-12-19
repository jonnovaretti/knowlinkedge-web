# frozen_string_literal: true

class Study
  belongs_to :user
  validates :title, presence: true
end
