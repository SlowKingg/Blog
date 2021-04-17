class LikesController < ApplicationController
  before_action :set_like, only: %i[create destroy count_like]

  def destroy
    @like = @post.likes.find(params[:id])
    if @like.present?
      @like.destroy
      count_like
      redirect_to post_path(@post), notice: 'dislike'
    else
      redirect_to post_path(@post), notice: 'dislike error'
    end
  end

  def create
    @like = @post.likes.new(user_id: current_user.id)
    count_like
    if @like.save
      redirect_to post_path(@post), notice: 'like'
    else
      redirect_to post_path(@post), notice: 'like error'
    end
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
  end

  def count_like
    @post.update(count_like: @post.likes.count)
    @post.count_like = @post.likes.count
    @post.save
  end

  def like_params
    params.require(:like).permit(:user_id)
  end
end
