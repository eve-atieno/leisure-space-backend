class MediaController < ApplicationController
    skip_before_action :authorized, only: [:create, :loggedin, :index, :show, :update, :destroy]

    def index
        media=Medium.all
        render json: media
    end

    def show
        media=Medium.find(params[:id])
        render json: media
    end

    def create
        if params[:image_url].present?
          file_ext = File.extname(params[:image_url].original_filename).downcase
          if %w(.jpg .jpeg .png).include?(file_ext)
            @medium = Medium.new(medium_params)
            if @medium.save
              render json: @medium, status: :created
            else
              render json: @medium.errors, status: :unprocessable_entity
            end
          else
            render json: { error: 'Invalid file type. Only JPG, JPEG and PNG files are allowed.' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Image file is required.' }, status: :unprocessable_entity
        end
      end
      
      
      


    def update
        media=Medium.find(params[:id])
        media.update(media_params)
        render json: media
    end

    def destroy
        media=Medium.find(params[:id])
        media.destroy
        render json: media
    end

    private

    def medium_params
        params.permit(:image_url, :space_id)
      end


end
