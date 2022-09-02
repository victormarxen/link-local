class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favourite, only: %i[destroy]

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.user = current_user
    if @favourite.save
      redirect_to my_profile_path
    else
      render "categories#show"
    end
  end

  def destroy
    @favourite.destroy
    redirect_to my_profile_path, status: :see_other
  end

  private

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end

  def favourite_params
    params.permit(:bookmark_id)
  end
end
