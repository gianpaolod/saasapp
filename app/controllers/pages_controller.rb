class PagesController < ApplicationController
  def home
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
    if user_signed_in?
      @micropost = current_user.microposts.new
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end