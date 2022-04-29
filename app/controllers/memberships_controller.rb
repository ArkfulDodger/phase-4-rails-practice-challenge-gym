class MembershipsController < ApplicationController
  # GET /memberships
  def index
    memberships = Membership.all
    render json: memberships
  end

  # POST /memberships
  def create
    new_membership = Membership.create!(membership_params)
    render json: new_membership, status: :created
  end

  private

  # permissible params to be used by create/update
  def membership_params
    params.permit(:gym_id, :client_id, :charge)
  end
end
