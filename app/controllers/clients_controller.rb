class ClientsController < ApplicationController

    # GET /clients
    def index
        all_clients
        render json: all_clients, status: :ok
    end

    # GET /clients/:id
    def show 
        find_client
        render json: find_client, status: :ok
    end

    # UPDATE /clients/:id
    def update 
        find_client
        find_client.update!(client_params)
        render json: find_client, status: :created
    end

    private 

    def find_client
        Client.find(params[:id])
    end

    def all_clients
        Client.all
    end

    def client_params
        params.permit(:name, :age)
    end
end
