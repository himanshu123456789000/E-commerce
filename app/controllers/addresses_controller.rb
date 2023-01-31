class AddressesController < ApplicationController
    def create
        @address = Address.new(address_params)
        if @address.save
            render json: {product: @address, message: "Your product is added"}
        else
            render json: {product: @address.errors.messages, message: "Sorry you address is not added"}
      end
    end

    private
    def address_params
        params.require(:address).permit!
    end
end
