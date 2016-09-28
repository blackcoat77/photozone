class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save!

    respond_to do |format|
    format.html { redirect_to post_path(@post) }
    format.js # render comments/create.js.erb
    end
    # redirect_to post_path(@post)
  end

  def destroy
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
   @comment.destroy

   redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end
end
