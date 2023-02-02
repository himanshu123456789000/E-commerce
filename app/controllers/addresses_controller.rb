class AddressesController < ApplicationController
  skip_before_action :check_access
  
  def create
    if current_user.role == 'buyer'
      address = Address.new(address_params)
      address.user_id = current_user.id

      if address.save
        render json: {product: address, message: 'Your product is added'}
      else
        render json: {product: address.errors.messages}
      end
    else
      render json:  {message: 'You are seller'}, status: :unauthorized
    end
  end

  def destroy
    user_id = current_user.id
    address = Address.find_by(user_id: user_id)

    if @product.user_id == current_user.id
      @product.destroy 
      render json:  {message: 'Product destroyed Successfully'}, status: :ok 
    else
      render json:  {message: "You can't destroy other seller product" }, status: :ok 
    end
  end

  private

  def address_params
    params.require(:address).permit!
  end
end
