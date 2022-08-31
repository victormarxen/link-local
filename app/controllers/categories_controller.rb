class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_category, only: %i[show]

  def index
    # if params[:country].present?
    #   country = Country.find_by(name: params[:country])

    #   if country
    #     @categories = Category.joins(applications: :bookmarks)
    #                           .where(bookmarks: { country_id: country.id })
    #   end
    # else

    # end
    @categories = Category.all
  end

  def show
    if params[:country].present?
      country = Country.find_by(name: params[:country])

      @applications = Application.joins(:countries).where(countries: { id: country.id })
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
