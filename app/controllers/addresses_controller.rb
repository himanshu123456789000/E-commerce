class AddressesController < ApplicationController
    def create
        address = Address.new(address_params)
        address.user_id = current_user.id
        if address.save
            render json: {product: address, message: "Your product is added"}
        else
            render json: {product: address.errors.messages}
        end
    end

    private
    def address_params
        params.require(:address).permit!
    end
end
