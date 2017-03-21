class PagesController < ApplicationController
  def home
    @external = Hierarchy.find(6)
    
    @internal 
    
    
  end
  
  def about
  end
end