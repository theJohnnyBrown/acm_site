class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    person = Person.authenticate(params[:session][:email],params[:session][:password])
    if person.nil?
      @title = "sign in"
      flash.now[:error] = 'username or password are incorrect'
      
      render 'new' 
    else
      #sign_in(person)
      redirect_to(person)
     
    end
  end

  def destroy
  end
end
