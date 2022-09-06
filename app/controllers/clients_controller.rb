class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok    
    end

    private

    def render_not_found_response(not_found)
        render json: { error: "#{not_found.model} not found"}
    end
end
