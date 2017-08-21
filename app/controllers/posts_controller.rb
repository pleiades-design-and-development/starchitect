class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = posts.all
    render json: @posts
  end

  def show
    render json: @post
  end


  def create
    @post = post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = post.find(params[:id])
  end

end
