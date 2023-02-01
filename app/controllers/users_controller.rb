class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
	def index
    current_user
		@users =User.all
		render json: {user: @users, current_user: current_user , status: :ok , message: "User found successfully" }
	end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render json: @user, status: :ok
    else
      render json: "You don't have authorization to access that user"
    end
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      $user_id = @user.id
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
    
  private
    
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :DOB, :gender, :role, :contact)
  end
end
