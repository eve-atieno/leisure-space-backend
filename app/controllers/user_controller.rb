class UsersController < ApplicationController
    skip_before_action :authorize, only:[:create]

    # GET /me
    def show
        user = User.find_by(id: session[:user_id])
        render json: user, status: :created
    end

    # POST /signup
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end


    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
end