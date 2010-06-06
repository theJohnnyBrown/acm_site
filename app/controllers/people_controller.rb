class PeopleController < ApplicationController
  def new
    @title = "sign up"
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
   def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

end
