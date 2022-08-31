class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    country = Country.find_by(name: params[:country])

    @applications = Application.joins(:countries)
                      .where(countries: { id: country&.id }, category: @category)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
