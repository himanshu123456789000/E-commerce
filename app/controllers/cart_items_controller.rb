class CartItemsController < ApplicationController

    def update
        debugger
        @cart_item = CartItem.find_by(params[:id])
        @cart_item.update(cart_item_params)
        render json: @cart_item
    end

    private
    def cart_item_params
        params.require(:cart_item).permit!
    end
end
