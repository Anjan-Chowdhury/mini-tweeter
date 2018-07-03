class CommentsController < ApplicationController
    def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @user_id = @post.user_id
  end
   def create
   	binding.pry
    comment = Comment.new(comment_params)
    if comment.save
      #nothing
    else
      flash[:error] = 'Cannot add answer'
    end
    redirect_to root_path
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
