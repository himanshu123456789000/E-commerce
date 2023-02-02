class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:update, :destroy]

  def index
    cart_items = current_user.cart.cart_items
    render json: cart_items ,status: :ok
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart = current_user.cart
    cart_item.cart_id = cart.id
    cart_item.save
    render json: { message: "Cart item added"} ,status: :ok
  end

  def update
    if @cart_item.user_id == current_user.id
      @cart_item.update(cart_item_params)
      render json: @cart_item, status: :ok
    else
      render json:  {message: "You can't destroy others items" }, status: :unauthorized
    end
  end

  def destroy
    if @cart_item.user_id == current_user.id
      @cart_item.destroy 
      render json:  {message: "item destroyed Successfully" }, status: :ok 
    else
      render json:  {message: "You can't destroy others items" }, status: :unauthorized
    end


  private

  def cart_item_params
    params.require(:cart_item).permit!
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
