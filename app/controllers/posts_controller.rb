class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @user_owner = User.find(@post.user_id)
  end

  def new
    @post = current_user.posts.build
  end

  def edit; end

  def create
    @post = current_user.posts.create(post_params)
    @post.update(count_like: 0)

    if @post.update(post_params)
      redirect_to @post, success: 'Article updated successfully'
    else
      render :new, error: 'The article has not been updated'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Article updated successfully'
    else
      render :edit, error: 'The article has not been updated'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :user_id, :draft, :image)
  end
end
