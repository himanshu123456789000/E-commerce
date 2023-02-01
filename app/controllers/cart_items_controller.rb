class CartItemsController < ApplicationController

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
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    render json: cart_item, status: :ok
  end

  private

  def cart_item_params
    params.require(:cart_item).permit!
  end
end
