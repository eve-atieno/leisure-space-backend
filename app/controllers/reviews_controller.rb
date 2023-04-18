class ReviewsController < ApplicationController
#get all reviews
    def index
        reviews = Review.all
        render json: reviews
        end
#get one review
    def show
        review = Review.find(params[:id])
        render json: review
        end
#create a review
    def create
        review = Review.create(review_params)
        render json: review
        end

# update a review
    def update
        review = Review.find(params[:id])
        review.update(review_params)
        render json: review
        end
#delete a review
    def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: review
        end

    private
    def review_params
        params.permit(:content, :rating, :space_id)
        end

        
end
