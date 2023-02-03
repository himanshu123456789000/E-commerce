class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # before_create :restrict_seller 
  # before_update :restrict_seller

  # private

  # def restrict_seller 
  #   if current_user.role == "seller"
  #     render json: {error: "You are not buyer" }, status: :unauthorized
  #   end 
  # end
end
