class UsersController < ApplicationController

before_action :authorize

def index
	users = User.all
	render json: users
end

def create
	user = User.create!(user_params)
	render json: user, status: :created
end

def update
	user = find_user
	user.update!(user_params)

	render json: user, status: :created
end

private

def authorize
		return render json: {error: "Not authorized to perform this action"}, status: :unauthorized unless session.inlude? :admin_id
end

def find_users
	User.find(params[:id])
end

end