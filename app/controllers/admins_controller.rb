class AdminsController < ApplicationController
  before_action :administration, only: [:show]
  skip_before_action :authorize, only: [:show, :create]
	
  # GET /admin
  def show
    admin = Admin.find(session[:admin_id])
    render json: admin, status: :created
  end

end
