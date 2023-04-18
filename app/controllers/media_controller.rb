class MediaController < ApplicationController
# gel all media
def index
    media = Media.all
    render json: media
end

# get media by id
def show
    media = Media.find(params[:id])
    render json: media
end

# create new media
def create
    media = Media.new(media_params)
    if media.save
        render json: media
    else
        render json: media.errors, status: :unprocessable_entity
    end
end

# update media
def update
    media = Media.find(params[:id])
    if media.update(media_params)
        render json: media
    else
        render json: media.errors, status: :unprocessable_entity
    end
end

# delete media
def destroy
    media = Media.find(params[:id])
    media.destroy
    render json: media
end

private
# strong params
def media_params
    params.permit(:image_url, :space_id)
end



end
