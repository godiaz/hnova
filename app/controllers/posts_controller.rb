class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
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
    postParams = params.require(:post).permit(:title, :body, :remove_image, images:[])
  end

  def set_post
    @post = post.find(params[:id])
  end
end
