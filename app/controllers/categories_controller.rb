class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    category = Category.new
    category.name = params[:add_category]
    if category.save
      redirect_to categories_path
    else
      redirect_to "/home"
    end
  end
end
