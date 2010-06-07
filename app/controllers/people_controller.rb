class PeopleController < ApplicationController
  def new
    @title = "sign up"
    @person = Person.new
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
  
  def create
    @person = Person.new params[:person]
    if @person.save
      #handle a successful save
      flash[:success] = "welcome to your UNO ACM profile : )"
      sign_in(@person)
      redirect_to(@person)
    else
      @title = "Sign up"
      render 'new'
    end
  end

end
