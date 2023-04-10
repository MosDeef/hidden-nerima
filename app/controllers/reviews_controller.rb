class ReviewsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.spot = @spot
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to spot_path(@spot)
    else
      render "spots/show", status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
