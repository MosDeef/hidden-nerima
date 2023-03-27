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
    @bookmark.save
  end

  def delete
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end


end
