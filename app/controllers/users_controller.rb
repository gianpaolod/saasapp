class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :following, :followers, :correct_user]
  
  def index
    @users = User.includes(:profile, :microposts) 
  end
  
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
    @microposts = @user.microposts.paginate( page: params[:page] )
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  # Before filters
  
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id]).includes(:profile, :microposts) 
    redirect_to(root_url) unless current_user?(@user)
  end
end