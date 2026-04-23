class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index

  end

  def show

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else

      flash[:alert] = "The following errors prevented the category from being saved: " + @category.errors.full_messages.join('<br>').html_safe
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end