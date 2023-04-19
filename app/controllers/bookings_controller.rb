class BookingsController < ApplicationController

    skip_before_action :authorize, only: [:show, :index, :create, :destroy, :checkout]

    # GET /bookings
    def index
        user = User.find_by(id: session[:user_id])
        @bookings = user.bookings.all
        total = @bookings.sum(:price)
        @booking_count = @bookings.booking_count
        render json: { bookingItems: @bookings, total: total, count: @booking_count }, include: {
            user: { except: [:password_digest, :created_at, :updated_at] }
        }, except: [:created_at, :updated_at], status: :created
    end

    # POST /bookings
    def bookings
        user = User.find_by(id: session[:user_id])
        bookings = user.bookings.all
        booking = user.bookings.create!(booking_params)
        total = bookings.sum(:price)
        booking_count = bookings.count
        render json: { bookingItems: bookings, total, count: booking_count }, status: :created
    end

    # DELETE /bookings/:id
    def destroy
        user = User.find_by(id: session[:user_id])
        booking = user.bookings.find_by(id: params[:id])
        booking.destroy
        total = user.bookings.all.sum(:price)
        booking_count = user.bookings.count
        render json: { bookingItems: user.bookings.all, total: total, count: booking_count }
    end

    # DELETE /bookings
    def checkout
        user = User.find_by(id: session[:user_id])
        booking = user.bookings
        booking.destroy_all
        head :no_content
    end

    private

    # Use callbacks to share common
    def set_booking
        @booking = Booking.find(params[:id])
    end

    # Allow a list of trusted parameters through
    def booking_params
        params.require(booking).permit(:name, :image, :price, :user_id)
    end

    def render_not_found_response
        render json: { error: "No space found" }, status: :not_found
    end
end
