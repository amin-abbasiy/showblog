class PostsController < ApplicationController
  def index
     @posts = Post.where("user_id = ? ", current_user.id)
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
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params) then
        flash[:success] = "Post Updated:)"
        redirect_to posts_path
    else
        flash[:danger] = "We Cant Apply It:("
        redirect_to request.referrer
    end
  end
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.paginate(page: params[:page])
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     flash[:success] = "Post Deleted"
     redirect_to request.referrer
  end
  private
  def post_params
     params.require(:post).permit(:title, :picture, :description)
  end
end
