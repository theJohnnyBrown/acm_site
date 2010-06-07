class SessionsController < ApplicationController
  #displays new.html.erb, which is a login form that has the effect of creating a new session
  # GET /sessions/new
  def new
    @title = "Sign in"
  end
  
  #used to login a user
  #logs user in if username and password are incorrect
  #POST /sessions
  def create
    person = Person.authenticate(params[:session][:email],params[:session][:password])
    if person.nil?
      @title = "sign in"
      flash.now[:error] = 'username or password are incorrect'
      
      render 'new' 
    else
      sign_in(person)
      redirect_to(person)
     
    end
  end

  #DELETE sessions/[id]
  def destroy
    sign_out
    redirect_to(root_path)
  end
end
