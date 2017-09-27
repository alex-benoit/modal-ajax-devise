class Message < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..+/i }
  validates :body, presence: true, length: { minimum: 15 }
end
