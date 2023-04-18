class BookingsController < ApplicationController
# get all
def index
    bookings = Booking.all
    render json: bookings
end

# get one
def show
    booking = Booking.find(params[:id])
    render json: booking
end

# create
def create
    booking = Booking.create(booking_params)
    render json: booking
end

# update
def update
    booking = Booking.find(params[:id])
    booking.update(booking_params)
    render json: booking
end

# delete
def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    render json: booking
end

private
def booking_params
    params.permit(:start_time, :end_time, :space_id)
end

end

