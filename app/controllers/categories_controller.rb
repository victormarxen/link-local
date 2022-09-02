class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def index
    @categories = Category.all
  end

  def show
    category = Category.find(params[:id])
    country = Country.find_by(name: params[:format])
    @bookmarks = Bookmark.joins(:application)
                         .where(country: country)
                         .where("applications.category_id = #{category.id}")
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
