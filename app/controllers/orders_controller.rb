class OrdersController < ApplicationController
  skip_before_action :check_access

  def index
    # user_id = current_user.id
    # product = Product.where(user_id: user_id)
    orders = Order.where() 
  end

  def create
    order = Order.new(order_params)
    order.user_id = current_user.id
    cart = User.find(current_user.id).cart
    order.cart_id = cart.id
    debugger
    if order.save
      render json: { message: "Your order placed successfully"}, status: :ok
    else
      render json: {order: order.errors.messages, message: "Sorry you order can't be added"}, status: :unprocessable_entity
    end
  end

  def update
    order = Order.find(params[:id])
    if order.user_id == current_user.id
      order.update(order_params)
      render json: order, status: :ok
    else
      render json:  {message: "You can't destroy others items" }, status: :unauthorized
    end
  end

  private
  def order_params
    params.require(:order).permit!
  end
end
