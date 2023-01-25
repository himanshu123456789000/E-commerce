class SessionsController < ApplicationController

  skip_before_action :authenticate_request
  def new
  end
  
  def create
    @user = User.find_by(email: params['email'].downcase)
    if @user && @user.authenticate(params['password'])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "unathorized"}, status: :unprocessable_entity
    end
  end
  
  def destroy
    log_out
    render json: {message: "logged out successfully"}, status: :ok
  end
end
