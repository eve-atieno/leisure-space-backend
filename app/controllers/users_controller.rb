class UsersController < ApplicationController

	# GET /users
	def index
	users = User.all
	render json: users
	end

	# GET /users/:id
	def show
	user = User.find(params[:id])
	render json: user
	end

	# POST /users
	def create
	user = User.new(user_params)
	if user.save
	render json: user
	else
	render json: user.errors, status: :unprocessable_entity
	end
end

	# PUT /users/:id
	def update
	user = User.find(params[:id])
	if user.update(user_params)
	render json: user
	else
	render json: user.errors, status: :unprocessable_entity
	end
	end

	# DELETE /users/:id
	def destroy
	user = User.find(params[:id])
	user.destroy
	end

	private

	def user_params
	params.permit(:email, :password, :is_active )
	end
end