class MediaController < ApplicationController

    before_action :set_media, only: %i[ show index create ]
	skip_before_action :authorize, only: %i[ show index create ]
	
	# GET /reviews
	def index
		@media = Media.all
		render json: @media, status: :ok
	end

	# GET /reviews/:id
	def show
		render json: set_media, status: :ok
	end

    # POST /reviews
    def create
		media = Media.create!(media_params)
		render json: media, status: :created
	end

    private

	def set_media
		@media = Media.find_by(id: params[:id])
	end

	def media_params
		params.require(:media).permit(:image_url)
	end

	def render_not_found_response
		render json: { error: "Media not found" }, status: :not_found
	end

end
