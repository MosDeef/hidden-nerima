class SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
    @review = Review.new
    @reviews = @spot.reviews
    @average_rating = @spot.average_rating
    @reviews = @spot.reviews.sort { |a, b| b.created_at <=> a.created_at}
    authorize @spot
    @markers = [lat: @spot.latitude,
                lng: @spot.longitude]
  end

  def index
    @spots = policy_scope(Spot)
    @spots = @spots.where(category: params[:category]) if params[:category]
    # @spots = @spots.where(sub_category: params[:sub_category]) if params[:sub_category] && params[:sub_category] != ""
    sql_subquery = "sub_category ILIKE :sub_category OR description ILIKE :sub_category"
    @spots = @spots.where(sql_subquery, sub_category: "%#{params[:sub_category]}%")
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    authorize @spot
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render "new", status: :unprocessable_entity
    end
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

  private

  def spot_params
    params.require(:spot).permit(:name, :location, :description, :category, :hours_open, :sub_category, photos: [])
  end
end
