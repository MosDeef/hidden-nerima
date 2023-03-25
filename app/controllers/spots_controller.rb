class SpotsController < ApplicationController

  def show
    @spot = Spot.find(params[:id])
    authorize @spot
  end

  def index
    @spots = policy_scope(Spot)
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    authorize @spot
    @spot.save
  end


  def edit
    @spot = Spot.find(params[:id])
    authorize @spot
  end
  def update
    @spot = Spot.find(params[:id])
    authorize @spot
    @spot.update(spot_params)
  end

  def destroy
    @spot = Spot.find(:id)
    authorize @spot
  end

  def spot_params
    params.require(:spot).permit(:name, :location, :description, :category, :hours_open, :type,)
  end
end
