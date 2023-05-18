class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # GET /gyms
    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    # GET /gyms/:id
    def show
        find_gym
        render json: find_gym, status: :ok
    end

    # UPDATE /gyms/:id
    def update 
        find_gym
        find_gym.update!(gym_params)
        render json: find_gym, status: :created
    end

    # DELETE /gyms/:id
    def destroy
        find_gym.destroy
        head :no_content
    end

    private 

    def find_gym
        Gym.find(params[:id])
    end

    def render_not_found_response
        render json: {
            error: "Gym not found"
        }, status: :not_found
    end

    def gym_params
        params.permit(:name, :address)
    end
end
