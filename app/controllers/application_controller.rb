class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  def current_user
    current_user = $current_user
  end 

  private 
   def authenticate_request
    header = request.headers["token"]
    header = header.split(" ").last if header 
    decoded = jwt_decode(header)
    $current_user = User.find(decoded[:user_id])
   end

   def create_cart
    @cart = Cart.new()
    @cart.user_id = $user_id
    @cart.save
    render json: { message: "cart created"} ,status: :ok
  end

   
end

