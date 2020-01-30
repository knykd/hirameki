class Word < ApplicationRecord
  has_many :keywords, dependent: :destroy
  has_many :ideas, through: :keywords

  validates :name, presence: true
end
