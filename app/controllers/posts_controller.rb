class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:q] && !params[:q].empty?
      @tags = params[:q].split(' ')
      @posts = Post.tagged_with(@tags).desc.paginate(page: params[:page], per_page: 40)
    else
      @posts = Post.desc.paginate(page: params[:page], per_page: 40)
    end
  end

  def show
    @post = Post.find(params[:id])
    @sidebar_tags = @post.tags
    @dimensions = FastImage.size(@post.picture_url)
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
