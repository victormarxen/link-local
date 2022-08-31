class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    if params[:country].present?
      country = Country.find_by(name: params[:country].capitalize)
      category_id = params[:id]

      @applications = Application.joins(:countries).where(countries: { id: country&.id }, category_id:)
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
