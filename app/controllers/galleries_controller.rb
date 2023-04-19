class GalleriesController < ApplicationController

    before_action :set_gallery, only: %i[ show index create ]
	skip_before_action :authorize, only: %i[ show index create ]
	
	# GET /reviews
	def index
		@galleries = Gallery.all
		render json: @galleries, status: :ok
	end

	# GET /reviews/:id
	def show
		render json: set_gallery, status: :ok
	end

    # POST /reviews
    def create
		gallery = Gallery.create!(gallery_params)
		render json: gallery, status: :created
	end

    private

	def set_gallery
		@gallery = Gallery.find_by(id: params[:id])
	end

	def gallery_params
		params.require(:gallery).permit(:image_url)
	end

	def render_not_found_response
		render json: { error: "Gallery not found" }, status: :not_found
	end

end
