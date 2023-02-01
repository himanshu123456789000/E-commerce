class ProductsController < ApplicationController
    before_action :require_buyer, only: [:index]
    before_action :require_seller, only: [:show, :create, :destroy, :update]

    def index
      products = Product.all
      render json: products
    end
    
    def show
      user_id = current_user.id
      products = Product.where(user_id: user_id)
      if products == []
        render json: { message: "No product found" }
      else
        render json: products
      end
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
      @product = Product.find(params[:id])
      if @product.user_id == current_user.id
        @product.destroy 
        render json:  {message: "product destroyed Successfully" }, status: :ok 
      else
        render json:  {message: "You can't destroy other seller product" }, status: :ok 
      end
    end
  
    def update
      @product = Product.find(params[:id])
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

    def require_buyer
      unless current_user.role == "buyer"
        render json: {error: "You don't have access" }, status: :unauthorized
      end
    end

    def require_seller
      unless current_user.role == "seller"
        render json: {error: "You don't have access" }, status: :unauthorized
      end
    end
end
