class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favourite, only: %i[destroy]

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
  end

  def destroy
    @favourites.destroy
    redirect_to favourites_path, status: :see_other
  end

  private

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
