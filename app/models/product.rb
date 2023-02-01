class Product < ApplicationRecord
  belongs_to :user
  has_one :cart_item
  has_many :orders

  before_create :restrict_buyer 
  before_destroy :restrict_buyer

  private
  def restrict_buyer 
    if current_user.role == "buyer"
      render json: {error: "You are not seller" }, status: :unauthorized
    end 
  end
end
