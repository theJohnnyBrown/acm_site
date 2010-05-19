class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def events
    @title = "Events"
  end
  
  def about 
    @title = "About"
  end

end
