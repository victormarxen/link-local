class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favourite, only: %i[destroy]

  def index
    @favourites = current_user.favourites
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.user = current_user
    @favourite.save
  end

  def destroy
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end

  private

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end

  def favourite_params
    params.permit(:bookmark_id)
  end
end
