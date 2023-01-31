class CartItemsController < ApplicationController

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

    def update
        @cart_item = CartItem.find(params[:id])
        debugger
        @cart_item.update(cart_item_params)
        render json: @cart_item, status: :ok
    end

    private
    def cart_item_params
        params.require(:cart_item).permit!
    end
end
