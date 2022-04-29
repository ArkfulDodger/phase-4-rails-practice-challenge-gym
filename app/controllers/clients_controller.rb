class ClientsController < ApplicationController
  before_action :find_client, only: %i[show update]

  # GET /clients
  def index
    clients = Client.all
    render json: clients
  end

  # GET /clients/:id
  def show
    render json: @client, methods: :memberships_total
  end

  # PATCH /clients/:id
  def update
    @client.update!(client_params)
    render json: @client, status: :accepted
  end

  private

  # set instance variable for show/update/destroy
  def find_client
    @client = Client.find(params[:id])
  end

  # permissible params to be used by create/update
  def client_params
    params.permit(:name, :age)
  end
end
