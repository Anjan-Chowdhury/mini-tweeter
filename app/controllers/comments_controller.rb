class CommentsController < ApplicationController
    def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @user_id = @post.user_id
  end
   def create
   	post_id = params["comment"]["post_id"]
    comment = Comment.new(comment_params)
    if comment.save
      #nothing
    else
      flash[:error] = 'Cannot add answer'
    end
    redirect_to comment_for_following_post_comments_path(post_id: post_id)
   end

   def comment_for_following_post
   	 post_id = params[:post_id]
     @comments = Comment.where(post_id: post_id)
   	end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def get_params(id)
    params[:comment][id]
  end

  def comment_params
    params.require(:comment).permit(:content_details, :user_id, :post_id)
  end
end
