class GymsController < ApplicationController
    rescue_from ActiveRecord:RecordNotFound, with: :render_response_not_found

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok 
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def render_not_found_response(not_found)
        render json: { error: "#{not_found.model} not found"}
    end
end
