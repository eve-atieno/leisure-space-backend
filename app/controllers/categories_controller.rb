class CategoriesController < ApplicationController
    skip_before_action :authorize, only: [:index, :show, :update, :create, :destroy]
    before_action :administration
    skip_before_action :administration, only: [:index, :show, :update, :create, :destroy]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # GET /categories
    def index
        @categories = Category.all
        render json: @categories
    end

    # GET /categories/:id
    def show
        category = set_category
        spaces = Space.where(category_id: category.id)
        render json: spaces
    end

    # POST /categories
    def create
        category = Category.create!(category_params)
        render json: category, status: :created
    end

    # PATCH /categories/:id
    def update
        category = Categpry.find_by(id: params[:id])
        category.update(category_params)
        render json: category, status: :created
    end

    # DELETE /categories/:id
    def destroy
        category = Category.find_by(id: params[:id])
        category.destroy
        head :no_content
    end


    private
    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:image, :name)
    end

    def render_not_found_response
        render json: { error: "Category not found" }, status: :not_found
    end
end