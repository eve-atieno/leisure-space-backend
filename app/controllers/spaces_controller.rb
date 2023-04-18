class SpacesController < ApplicationController
# get all spaces
def index
	spaces = Space.all
	render json: spaces
end

# get a space
def show
	space = Space.find(params[:id])
	render json: space
end

# create a space
def create
	space = Space.create(space_params)
	if space.save
		render json: space.as_json(only: [:id, :name, :description, :location, :price]), status: :created
	else
		render json: space.errors, status: :unprocessable_entity
	end
end

# update a space
def update
	space = Space.find(params[:id])
	space.update_attributes(space_params)
	render json: space
end

# delete a space
def destroy
	space = Space.find(params[:id])
	space.destroy
	head :no_content, status: :ok
end

private

def space_params
	params.permit(:name, :description, :location, :price)
end
end


