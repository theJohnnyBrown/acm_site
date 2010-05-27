class PeopleController < ApplicationController
  def new
  end
  
  
   def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

end
