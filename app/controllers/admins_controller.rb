class AdminsController < ApplicationController
  
  def index
    admins = Admin.all
    render json: admins
  end

  def show
    admin = Admin.find(session[:admin_id])
    render json: admin
  end

  def create
    user = Admin.create(admin_params)
    if user.valid?
      render json: { user: user }, status: :created
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def update
    admin = Admin.find(session[:admin_id])
    admin.update(admin_params)
    render json: admin
  end

  def destroy
    admin = Admin.find(session[:admin_id])
    admin.destroy
    render json: admin
  end

  private 

  def admin_params
    params.permit(:name , :password, :email)
  end

end
