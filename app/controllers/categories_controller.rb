class CategoriesController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_category

  def show
    # callback method set_category
    @posts = @category.posts.page(params[:page]).per(9)

    respond_to do |format|
     format.html # index.html.erb
     format.json { render json: @posts }
     format.js
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
    # admin can destroy using rails_admin gem
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
