class PostsController < ApplicationController
  def index
    if params[:q] && !params[:q].empty?
      @tags = params[:q].split(' ')
      @posts = Post.tagged_with(@tags).desc
    else
      @posts = Post.desc
    end
  end

  def show
    @post = Post.find(params[:id])
    @sidebar_tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      redirect_to request.referer, notice: "Well, something went wrong"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :source, :picture, :tag_list)
  end
end
