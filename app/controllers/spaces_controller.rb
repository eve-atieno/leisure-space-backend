class SpacesController < ApplicationController

    def index
        spaces=Space.all
        render json: spaces
    end

    def show
        space=Space.find(params[:id])
        render json: space
    end

    def create
        space=Space.create(space_params)
        render json: space
    end

    def update
        space=Space.find(params[:id])
        space.update(space_params)
        render json: space
    end

    def destroy
        space=Space.find(params[:id])
        space.destroy
        render json: space
    end

    private

    def space_params
        params.permit(:name, :location, :description, :price, :admin_id)
    end
end
