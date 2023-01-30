class CartsController < ApplicationController
    def index
        @cart = current_user.cart.cart_items
        render json: @cart ,status: :ok
    end

    def create
        @cart = CartItem.new(cart_item_params)
        user = current_user.cart
        @cart.cart_id = user.id
        @cart.count = 1
        @cart.save
        render json: { message: "cart item added"} ,status: :ok
    end

    private
    def cart_item_params
        params.require(:cart_item).permit!
    end
end
