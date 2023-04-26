class ProfilesController < ApplicationController
    skip_before_action :authorized, only: [:create, :loggedin, :index, :show, :update, :destroy]

    def index
        profiles=Profile.all
        render json: profiles
    end

    def show
        profile=Profile.find(params[:id])
        render json: profile
    end

    def create
        profile=Profile.create(profile_params)
        render json: profile
    end

    def update
        profile=Profile.find(params[:id])
        profile.update(profile_params)
        render json: profile
    end

    def destroy
        profile=Profile.find(params[:id])
        profile.destroy
        render json: profile
    end

    private

    def profile_params
        params.permit(:name, :profile_picture, :description, :user_id)
    end
end
