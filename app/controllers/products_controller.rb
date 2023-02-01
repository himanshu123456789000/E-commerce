class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]
  before_action :require_seller, only: [:index, :show, :create, :destroy, :update]

  def index
    if current_user.role == "seller"
      products = current_user.products
      render json: products, status: :ok
    else
      products = Product.all
      render json: products, status: :ok
    end
  end

  def create
    product = Product.new(product_params)
    product.user_id = current_user.id
    
    if product.save
      render json: {product: product, message: "Your product is added"}, status: :ok
    else
      render json: {product: product.errors.messages, message: "Sorry you can not add product"}
    end
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy 
      render json:  {message: "product destroyed Successfully" }, status: :ok 
    else
      render json:  {message: "You can't destroy other seller product" }, status: :unauthorized
    end
  end

  def update
    if current_user.id == @product.user_id
      @product.update(product_params)
      render json: @product, status: :ok
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

  def require_seller
    unless current_user.role == "seller"
      render json: {error: "You are not seller" }, status: :unauthorized
    end
  end
end
