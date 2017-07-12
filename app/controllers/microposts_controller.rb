class MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
  
  
  def create
    @microposts = current_user.microposts.build(micropost_params)
    if @microposts.save
      flash[:success] = "Micropost created!"
      redirect_back(fallback_location: root_url)
    else
      @feed_items = []
      redirect_back(fallback_location: root_url)
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_back(fallback_location: root_url)
  end
  
  private
  
    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      if @micropost.nil? 
        flash[:danger] = "This is not your Micropost"
        redirect_back(fallback_location: root_path)
      end
        
    end
end
