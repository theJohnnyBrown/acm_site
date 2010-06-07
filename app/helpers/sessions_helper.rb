module SessionsHelper
        #adds a cookie to the user's browser that matches an attribute of the Person in the database that the user logged in as
	def sign_in(person)
	  person.remember_me!
	  cookies[:remember_token] = { :value   => person.remember_token,
	                                 :expires => 20.years.from_now.utc }
	  self.current_person = person
	end
	
	#removes the cookie from the user's browser so they are no longer logged in. 
	#undoes sign_in
	def sign_out
	  cookies.delete(:remember_token)
	  self.current_person = nil
	end
	
	def current_person=(person)
	  @current_person = person
	end

	#unless @current_person.nil?, returns @current_person
	#else returns the Person whose remember_token matches the remember_token cookie on the user's browser
	def current_person
	  @current_person ||= person_from_remember_token
	end
	
	def current_person?(person)
	  person == current_person
	end
	
	#gets the Person whose remember_token matches the remember_token cookie on the user's browser
	def person_from_remember_token
	  remember_token = cookies[:remember_token]
	  Person.find_by_remember_token(remember_token) unless remember_token.nil?
	end

	def signed_in?
	  !current_person.nil?
	end
	
	#redirect to the login page
	def deny_access
	  flash[:notice] = "Please sign in to access this page."
          redirect_to signin_path
	end
	
	

end
