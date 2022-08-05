class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save{email.downcase!}
  validates :name,
            presence: true,
            length: {maximum: Settings.validates.name.max_length}
  validates :email,
            presence: true,
            length: {maximum: Settings.validates.email.max_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: true
  has_secure_password
  validates :password,
            presence: true,
            length: {minimum: Settings.validates.password.min_length}
end
