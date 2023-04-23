class UsersController < ApplicationController

    skip_before_action :authorize, only:[:create]

    # def index
    # 	users = User.all
    # 	render json: users
    # end

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

    # def update
    # 	user = find_user
    # 	user.update!(user_params)

    # 	render json: user, status: :created
    # end

    private

    # def authorize
    # 		return render json: {error: "Not authorized to perform this action"}, status: :unauthorized unless session.inlude? :admin_id
    # end

    # def find_users
    # 	User.find(params[:id])
    # end

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end
end