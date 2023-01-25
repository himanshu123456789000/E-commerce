class User < ApplicationRecord
  # before_save { self.email = email.downcase }

  has_secure_password
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }

  VALID_GENDERS = ['male', 'female', 'trans']
  validates :gender, inclusion: { in: VALID_GENDERS }

  VALID_ROLES = ['user', 'seller']
  validates :role, inclusion: { in: VALID_ROLES }
end
