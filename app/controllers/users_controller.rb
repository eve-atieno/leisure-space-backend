class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :loggedin, :index, :show, :update, :destroy]
    
    def index
        user = User.all
        render json: user, include: [:services, :books]
    end

    def show
       user = User.find_by(id: params[:id])
        # include user's services and books
        render json: user, include: [:services, :books]
    end

    def create
        user = User.create(user_params)
        if user.valid?
          render json: { user: user }, status: :created
        else
          render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
    end

    def destroy
        @user.destroy
    end
        

    # def loggedin
    #     user = User.find_by(id: session[:user_id] ) 
    #     if(user)
    #        render json: {loggedin: true, user: user}
    #     else
    #        render json: {loggedin: false}
    #     end      
    #   end

    private

    def set_user
        @user = Usr.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :password , :password_confirmation)
    end

end