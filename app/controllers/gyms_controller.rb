class GymsController < ApplicationController
  # assign @gym variable based on params[:id]
  before_action :find_gym, only: %i[show update destroy]

  # GET /gyms
  def index
    gyms = Gym.all
    render json: gyms
  end

  # GET /gyms/:id
  def show
    render json: @gym
  end

  # PATCH /gyms/:id
  def update
    @gym.update!(gym_params)
    render json: @gym, status: :accepted
  end

  # DELETE /gyms/:id
  def destroy
    @gym.destroy

    head :no_content
  end

  private

  # set instance variable for show/update/destroy
  def find_gym
    @gym = Gym.find(params[:id])
  end

  # permissible params to be used by create/update
  def gym_params
    params.permit(:name, :address)
  end
end
