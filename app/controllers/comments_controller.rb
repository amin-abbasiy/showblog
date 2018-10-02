class CommentsController < ApplicationController
   def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_param)
      @comment.user_id = current_user.id
      if @comment.save then
          flash[:success] = "Comment Added:)"
          redirect_to request.referrer
      else
          flash[:danger] = "Do Not Compose:("
          redirect_to request.referrer 
      end
   end

   private
   def comment_param
      params.require(:comment).permit(:content)
   end
end
