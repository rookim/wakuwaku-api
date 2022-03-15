class User < ApplicationRecord
  PASSWORD_FORMAT = /\A
  (?=.{6,})          # Must contain 6 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[!?@$])       # Must contain a symbol
/x
  
  has_many :favorites
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, length: {minimum: 3}
  validates :password, length: {minimum: 6}, format: {with: PASSWORD_FORMAT, message: "needs to contain all the requirements!"}
end
