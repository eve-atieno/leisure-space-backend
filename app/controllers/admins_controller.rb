class AdminsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show, :create, :update, :destroy]


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


  private 

  def admin_params
    params.permit(:name , :password, :email)
  end

end
