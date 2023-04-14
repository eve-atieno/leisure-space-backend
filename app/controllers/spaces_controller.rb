class SpacesController < ApplicationController

	before_action :authorize
	skip_before_action :authorize, only: %i[index show]
	
	def index
		spaces = Space.all
		render json: spaces, status: :ok
	end

	def show
		space = find_space
		render json: space, status: :ok
	end

	def create
		space = Space.create(space_params)
	end


	private

	def find_space
		Space.find(params[:id])
	end

	def space_params

	end

	def authorize
		return render json: {error: "Not authorized to perform this action"}, status: :unauthorized unless session.inlude? :admin_id
	end
end


