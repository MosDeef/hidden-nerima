class BookmarksController < ApplicationController
  def index
    @bookmarks = policy_scope(Bookmark)
  end

  def create
    @bookmark = Bookmark.new()
    # ToDo, make sure that the params will be :spot_id and not :id
    @spot = Spot.find(params[:spot_id])
    @bookmark.user = current_user
    @bookmark.spot = @spot
    authorize @bookmark
    # TODO: decide what we want to to after saved bookmark
    # maybe just keep you on the same page, but update screen element?
    if @bookmark.save
      redirect_to spot_path(@spot)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @spot = @bookmark.spot
    authorize @bookmark
    if current_user.bookmarks.where(spot: @spot).destroy_all
      redirect_to spot_path(@spot)
    end
  end
end
