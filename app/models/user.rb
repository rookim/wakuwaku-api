class User < ApplicationRecord
  has_many :favorites
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
end
