class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :destroy, :update]
  
    def index
      products = Product.all
      render json: products
    end
    def show 
      product = Product.find(params[:id])
      render json: product
    end
  
    def create
      @product = Product.new(product_params)
      @product.user_id = current_user.id
      if @product.save
        render json: {product: @product, message: "Your product is added"}
      else
        render json: {product: @product.errors.messages, message: "Sorry you can not add product"}
      end
    end
  
    def destroy
      debugger
      if @product.user_id == current_user.id
        @product.destroy 
        render json:  {message: "product destroyed Successfully" }, status: :ok 
      else
        render json:  {message: "You can't destroy other seller product" }, status: :ok 
      end
    end
  
    def update
      debugger
      if current_user.id == @product.user_id
        @product.update(product_params)
        render json: @product
      else
        render json:  {message: "you don't have access to update" }, status: :ok 
      end
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :details, :price, :user_id)
    end
  
    def set_product
      @product = Product.find(params[:id])
    end
end
