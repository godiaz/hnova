class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(:created_at).page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:error] = 'Didn\'t save'
    end
  end

  def edit
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :remove_image, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
