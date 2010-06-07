class PeopleController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_person, :only => [:edit, :update]
  
  #displays the signup form to create a new person
  #GET /people/new
  def new
    @title = "sign up"
    @person = Person.new
  end
  
  #displays the person indicated by the id param
  #GET /people/[id]
  def show
    @person = Person.find(params[:id])
  end
  
  #gets the form to edit a Person's info/profile
  #before_filter s prevent anyone but the correct logged in user from editing their profile
  #GET /people/edit
  def edit
    @person = Person.find(params[:id])
    @groups = Group.all
    @title = "Edit profile"
  end
  #sets the given Person 's attributes to those given in params
  ##before_filter s prevent anyone but the correct logged in user from editing their profile
  #PUT people/[id]
  def update
    params[:person][:group_ids] ||= [] #covers the case where the person has removed all groups
  
    @person = Person.find(params[:id])
    
    if @person.update_attributes(params[:person])  
      flash[:success] = "Profile updated."
      redirect_to @person
    else
      @title = "Edit user"
      @groups = Group.all
      render 'edit'
    end    
  end
   #displays views/people/index.html.erb
   #GET /people
   def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end
  
  #sign up a new Person, and also signs in the person
  #POST /people
  def create
    @person = Person.new params[:person]
    if @person.save
      flash[:success] = "welcome to your UNO ACM profile : )"
      sign_in(@person)
      redirect_to(@person)
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  private
    
    #if the current request does not come from a logged in user, redirects to the login page
    def authenticate
      deny_access unless signed_in?
    end
    
    #if the current request does not come from a browser whoser remember_token matches that of the user 
    #indicated by params([:id]), redirects to the home page    
    def correct_person
      @person = Person.find(params[:id])
      redirect_to(root_path) unless current_person?(@person)
    end

end
