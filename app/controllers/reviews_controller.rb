class ReviewsController < ApplicationController
	skip_before_action :authorized, only: [:create, :loggedin, :index, :show, :update, :destroy]

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
		params.require(:review).permit(:comment, :rating , :profile_id, :space_id)
	end

	def render_not_found_response
		render json: { error: "Review not found" }, status: :not_found
	end

end
