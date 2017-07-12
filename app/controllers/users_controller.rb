class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.includes(:profile, :microposts) 
  end
  
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
    @microposts = @user.microposts.paginate( page: params[:page] )
  end

  # Before filters
  
  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id]).includes(:profile, :microposts) 
    redirect_to(root_url) unless current_user?(@user)
  end
end