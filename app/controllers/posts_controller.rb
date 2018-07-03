class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def post_by_following_users
  	 all_followers = Follower.where(following_id: params[:user_id]).map(&:follower_id)
  	 all_followers.uniq
  	 @all_posts = Post.where(user_id: all_followers) 
  	redirect_to root_path
  end

  def create
    @user = User.find( params.dig(:post).dig(:user_id))
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path(@user)
    else
      flash[:error] = 'post is not created'
      redirect_to root_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @user = User.find(params[:user_id])
    @vote = Vote.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :user_id, :post_content)
  end
end
