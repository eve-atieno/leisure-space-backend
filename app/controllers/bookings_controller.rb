class BookingsController < ApplicationController

    skip_before_action :authorized, only: [:create, :loggedin, :index, :show, :update, :destroy]

    # GET /bookings
    def index
    booking= Booking.all
    render json: booking,include: [:space, :profile]
    end

    def show
        booking = Booking.find_by(id: params[:id])
        render json: booking
    end
    

    # POST /bookings
    def create
        booking = Booking.create(booking_params)
        if booking.valid?
          render json: { booking: booking }, status: :created
        else
          render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
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
        params.permit(:start_date, :end_date, :profile_id, :space_id)
    end

    def render_not_found_response
        render json: { error: "No space found" }, status: :not_found
    end
end
