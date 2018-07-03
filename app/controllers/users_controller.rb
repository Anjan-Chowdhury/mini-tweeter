class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      flash[:error] = 'use is not created'
      redirect_to root_path
    end
  end

  # def show
  #   @user = User.find(params[:id])
  #   @post = if params[:category_id].blank?
  #     @user.questions
  #   else
  #     @category = Category.find(params[:category_id])
  #     Question.where(category_id: params[:category_id])
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number)
  end
end
