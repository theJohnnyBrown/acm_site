class PeopleController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_person, :only => [:edit, :update]
  
  def new
    @title = "sign up"
    @person = Person.new
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def edit
    @person = Person.find(params[:id])
    @groups = Group.all
    @title = "Edit profile"
  end
  
  def update
    params[:person][:group_ids] ||= []
  
    @person = Person.find(params[:id])
    
    if @person.update_attributes(params[:person])
      #@person.group_ids = params[:person][:group_ids]
  
      flash[:success] = "Profile updated."
      redirect_to @person
    else
      @title = "Edit user"
      @groups = Group.all
      render 'edit'
    end    
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
  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_person
      @person = Person.find(params[:id])
      redirect_to(root_path) unless current_person?(@person)
    end

end
