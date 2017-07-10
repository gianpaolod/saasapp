class PagesController < ApplicationController
  def home
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
    @micropost = current_user.microposts.build if user_signed_in?
  end
  
  def about
  end
end