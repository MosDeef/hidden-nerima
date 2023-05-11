class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_spots = @user.spots
    @my_bookmarks = @user.bookmarks
    authorize @user
  end

end
