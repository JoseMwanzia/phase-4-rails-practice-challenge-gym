class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

private 

    def render_not_found_response(e)
        render json: {
            error: e.to_s
        }, status: :not_found
    end

    def render_invalid_response(invalid)
        render json: {
            errors: invalid.record.errors.full_messages
            }, status: :unprocessable_entity
    end
end