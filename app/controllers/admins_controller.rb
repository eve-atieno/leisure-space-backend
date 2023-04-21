class AdminsController < ApplicationController
  before_action :administration, only: [:show]
  skip_before_action :authorize, only: [:show, :create]
	
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
    params.permit(:email, :password, :password_confirmation)
  end

    def index
        admins=Admin.all
        render json: admins
    end

    def show
        admin=Admin.find(params[:id])
        render json: admin
    end

    def create
        admin=Admin.create(admin_params)
       if admin.valid?
        render json: admin, status: :created
       else
        render json: { error: admin.errors.full_messages.join(', ') }, status: :unprocessable_entity
    
       end
    end

    def update
        admin=Admin.find(params[:id])
        admin.update(admin_params)
        render json: admin
    end

    def destroy
        admin=Admin.find(params[:id])
        admin.destroy
        render json: admin
    end

    private

    def admin_params
        params.permit(:name, :email, :password)
    end
end
