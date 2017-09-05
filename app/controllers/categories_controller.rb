class CategoriesController < ApplicationController
  before_action :find_category, except: [:index, :new, :create]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
