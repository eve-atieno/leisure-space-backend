class AdminsController < ApplicationController

    def index
        admins=Admin.all
        render json: admins
    end

    def show
        admin=Admin.find(params[:id])
        render json: admin
    end

    def create
        admin=Admin.create(admin_params)
        render json: admin
    end

    def update
        admin=Admin.find(params[:id])
        admin.update(admin_params)
        render json: admin
    end

    def destroy
        admin=Admin.find(params[:id])
        admin.destroy
        render json: admin
    end

    private

    def admin_params
        params.permit(:name, :email, :password)
    end
end
