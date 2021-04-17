class CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:post_id])
    if @comment.present?
      @comment.destroy
      redirect_to post_path, notice: 'comment delete'
    else
      redirect_to post_path, notice: 'comment not exists'
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.email = current_user.email

    if @comment.save
      redirect_to post_path(@post), notice: 'comment created'
    else
      redirect_to post_path(@post), notice: "comment don't created"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:email, :body)
  end
end
