class User < ApplicationRecord
  before_save { self.email = email.downcase } # before we save, change everything to lower case
  validates :name, presence: true, length: { maximum: 60 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: true } # can be true, because all email addresses will be lower case
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
