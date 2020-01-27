class Idea < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true
end
