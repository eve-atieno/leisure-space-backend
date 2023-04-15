
class ApplicationController < ActionController::Base
    include ActionController::Cookies

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    before_action :authorize

    def authorize
        return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
    end

    # Admin authorization
    def administration
        return render json: { errors: ["Not Admin!"] }, status: :unauthorized unless session.include? :admin_id
    end

    # Error Handling
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
