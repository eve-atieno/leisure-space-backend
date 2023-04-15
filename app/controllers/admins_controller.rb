class AdminsController < ApplicationController
	
  def show
    admin = Admin.find(session[:admin_id])
    render json: admin
  end

end
