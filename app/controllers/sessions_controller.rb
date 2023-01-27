class SessionsController < ApplicationController

  skip_before_action :authenticate_request
  def new
  end
  
  def create
    @user = User.find_by(email: params['email'].downcase)
    if @user && @user.authenticate(params['password'])
      $token = jwt_encode(user_id: @user.id)
      time = Time.now + 7.days.to_i
      render json: { token: $token, exp: time.strftime("%d-%m-%Y %H:%M"),
        username: @user.name }, status: :ok
    else
      render json: { error: "unathorized"}, status: :unprocessable_entity
    end
  end

  
end


