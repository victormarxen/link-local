class MyProfileController < ApplicationController
  def show
    @favourites = Favourite.where(user: current_user)
  end
end
