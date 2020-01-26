class Word < ApplicationRecord
  has_many :ideas, through: :keywords
  has_many :keywords, dependent: :destroy

  validates :name, presence: true
end
