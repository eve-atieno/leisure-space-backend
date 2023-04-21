class SessionsController < ApplicationController
    before_action :administration
    skip_before_action :administration, only: [:create, :destroy, :in]
    skip_before_action :authorize, only:[:create, :in, :out]

    # POST /login
    def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    # DELETE /logout
    def destroy
        session.delete :user_id
        head :no_content
    end

    # POST /adminin
    def in
        admin = Admin.find_by(email: params[:email])
        if admin && admin.authenticate(params[:password])
            session[:admin_id] = admin.id
            render json: admin, status: :created
        else
            render json: { errors: ["Invalid admin_name or password"] }, status: :unauthorized
        end
    end

    # DELETE /adminout
    def out
        session.delete :admin_id
        head :no_content
    end
end