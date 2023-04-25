class AdminsController < ApplicationController
  before_action :administration, only: [:show]
  skip_before_action :authorize, only: [:index, :show, :create]

  #GET /admins
  def index
    admin = Admin.all
    render json: admin, status: :ok
  end
	
  # GET /admin
  def show
    admin = Admin.find(session[:admin_id])
    render json: admin, status: :created
  end

  # POST /newadmin
  def create
    admin = Admin.create!(admin_params)
    render json: admin, status: :created
  end


  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end