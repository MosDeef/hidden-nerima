class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_spots = @user.spots
    @my_bookmark_spots = @user.bookmarks.map(&:spot)
    authorize @user
  end

end
