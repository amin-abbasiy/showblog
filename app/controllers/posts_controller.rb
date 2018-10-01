class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
     @post = current_user.posts.build(post_params)
     if @post.save then
         flash[:success] = "Post Build:)"
         redirect_to root_url
     else
         flash[:danger] = "We Can't Apply It:("
         redirect_to request.referrer
     end
  end
  def edit
  end

  def show
  end
  private
  def post_params
     params.require(:post).permit(:title, :picture, :description)
  end
end
