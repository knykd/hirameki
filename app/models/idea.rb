class Idea < ApplicationRecord
  belongs_to :user
  has_many :words, through: :keywords
  has_many :keywords, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

  validates :title, presence: true
end
