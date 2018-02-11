class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @posts = Post.create(
      user_id: params[:id],
      title: params[:title],
      content: params[:content]
    )
  end

  def update

  end

  def destroy
  end

  def edit
  end

  def add_comment
  end
end
