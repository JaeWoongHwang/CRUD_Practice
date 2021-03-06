class PostsController < ApplicationController
  before_action :authorize

  def index
    @posts = Post.all.reverse
    @comments = Comment.all
  end

  def new
  end

  def show
    @posts = Post.find(params[:id])
  end

  def create
    @posts = Post.create(
      user_id: current_user.id,
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    posts = Post.find(params[:id])
    posts.update(
        title: params[:title],
        content: params[:content]
      )
    redirect_to '/'
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy

    redirect_to '/'
  end

  def add_comment
    @comments = Comment.create(
      user_id: current_user.id,
      post_id: params[:id],
      content: params[:content]
    )

    redirect_to :back #"/posts/show/#{params[:id]}"
  end

  def edit_comment
    @comments = Comment.find(params[:id])
  end

  def update_comment
    comments = Comment.find(params[:id])
    comments.update(
      content: params[:content]
    )
    redirect_to '/'
  end

  def destroy_comment
    @comments = Comment.find(params[:id])
    @comments.destroy

    redirect_to :back
  end
end
