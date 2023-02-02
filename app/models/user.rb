class User < ApplicationRecord
  after_create :create_cart
  
  has_many :orders
  has_one :cart, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :addresses

  has_secure_password

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 3 }

  VALID_GENDERS = ['male', 'female', 'trans']
  validates :gender, inclusion: { in: VALID_GENDERS }

  VALID_ROLES = ['buyer', 'seller']
  validates :role, inclusion: { in: VALID_ROLES }
  
  private

  def create_cart
    Cart.create(user_id: self.id) if buyer?
  end

  def seller?
    self.role == 'seller'
  end

  def buyer?
    self.role == 'buyer' 
  end
end
