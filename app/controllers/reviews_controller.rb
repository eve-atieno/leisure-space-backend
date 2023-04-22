class ReviewsController < ApplicationController

    before_action :set_review, only: %i[ show index create ]
	skip_before_action :authorize, only: %i[ show index create ]
	
	# GET /reviews
	def index
		@reviews = Review.all
		render json: @reviews, status: :ok
	end

	# GET /reviews/:id
	def show
		render json: set_review, status: :ok
	end

    # POST /reviews
    def create
		review = Review.create!(review_params)
		render json: review, status: :created
	end

    private

	def set_review
		@review = Review.find_by(id: params[:id])
	end

	def review_params
		params.require(:review).permit(:content, :rating)
	end

	def render_not_found_response
		render json: { error: "Review not found" }, status: :not_found
	end

end
