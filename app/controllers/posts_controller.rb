class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

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
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

end
