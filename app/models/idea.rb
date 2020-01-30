class Idea < ApplicationRecord
  belongs_to :user
  has_many :keywords, dependent: :destroy
  has_many :words, through: :keywords

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true
end
