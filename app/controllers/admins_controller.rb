class AdminsController < ApplicationController
	
  def show
    admin = Admin.find(session[:user_id])
    render json: admin
  end

end
