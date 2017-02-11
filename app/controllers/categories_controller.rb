class CategoriesController < ApplicationController

  def new
    @category = Category.new
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
    @category = Category.find(params[:id])
    @jobs = (@category.jobs).sort_by { |job| job.title}
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end