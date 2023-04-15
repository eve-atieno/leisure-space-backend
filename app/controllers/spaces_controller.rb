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
		space = Space.create!(space_params)
		render json: space, status: :created
	end


	private

	def find_space
		Space.find(params[:id])
	end

	def space_params
		params.permit(:name, :description, :image_url)
	end

	def authorize
		render json: {error: "Not authorized to perform this action"}, status: :unauthorized unless session.inlude? :admin_id
	end
end


