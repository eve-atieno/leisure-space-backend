class BookingsController < ApplicationController

    def index
        bookings=Booking.all
        render json: bookings
    end

    def show
        booking=Booking.find(params[:id])
        render json: booking
    end

    def create
        booking=Booking.create(booking_params)
        render json: booking
    end

    def update
        booking=Booking.find(params[:id])
        booking.update(booking_params)
        render json: booking
    end

    def destroy
        booking=Booking.find(params[:id])
        booking.destroy
        render json: booking
    end

    private

    def booking_params
        params.permit(:start_date, :end_date, :profile_id, :space_id)
    end
end
