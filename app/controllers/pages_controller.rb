class PagesController < ApplicationController
  def home
    @contact = Contact.new
    if user_signed_in?
      @micropost = current_user.microposts.new
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end