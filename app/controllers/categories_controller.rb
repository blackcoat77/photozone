class CategoriesController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_category

  def index
    @categories = Category.all
  end

  def show
    # callback method set_category
  end

  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "The category has been successfully created"
      redirect_to post_path(@post)
    else
      flash[:error] = @category.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    # callback method set_category
  end
  def update
    if @category.update(category_params)
      flash[:success] = "Category has been successfully updated!"
      redirect_to post_path(@post)
    else
      flash[:error] = @category.errors.full_messages
      redirect_to edit_post_path
    end

  end

  def destroy
    # @category.destroy
    # redirect_to root_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
