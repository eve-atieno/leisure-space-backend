class ReviewsController < ApplicationController

    def index
        reviews=Review.all
        render json: reviews
    end

    def show
        reviews=Review.find(params[:id])
        render json: reviews
    end

    def create
        reviews=Review.create(reviews_params)
        render json: reviews
    end

    def update
        reviews=Review.find(params[:id])
        reviews.update(reviews_params)
        render json: reviews
    end

    def destroy
        reviews=Review.find(params[:id])
        reviews.destroy
        render json: reviews
    end

    private

    def reviews_params
        params.permit(:rating, :content, :profile_id, :space_id)
    end
end
