class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :ideas

  validates :password,
            length: { minimum: 3 },
            confirmation: true,
            if: -> { new_record? || changes[:crypted_password] }

  validates :password_confirmation,
            presence: true,
            if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :reset_password_token, uniqueness: true, allow_nil: true
end
