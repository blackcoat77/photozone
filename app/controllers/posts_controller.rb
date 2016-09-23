class PostsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote]

  def index
     @posts = Post.order(:created_at).page(params[:page]).per(9)

      respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @posts }
       format.js
     end
  end

  def show
    # callback set_post method
  end


  def edit
    # callback set_post method
  end
  def update


    if @post.update(post_params)
      flash[:success] = "Post has been successfully updated!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to edit_post_path
    end
  end


  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "The post has been successfully created!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end


  def destroy
    @post.destroy

    redirect_to root_path
  end

  def upvote
    @post.upvote_by(current_user)
    redirect_to :back
  end


  private

  def set_post
   @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :description, :user_id)
  end

end
