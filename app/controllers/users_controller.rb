class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_spots = @user.spots
    authorize @user
  end

end
