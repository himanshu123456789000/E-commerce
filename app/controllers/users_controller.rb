class UsersController < ApplicationController
  skip_before_action :authenticate_request
    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
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
