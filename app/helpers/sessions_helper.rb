module SessionsHelper

	def sign_in(person)
	  person.remember_me!
	  cookies[:remember_token] = { :value   => person.remember_token,
	                                 :expires => 20.years.from_now.utc }
	  self.current_person = person
	end

	def sign_out
	  cookies.delete(:remember_token)
	  self.current_person = nil
	end

	def current_person=(person)
	  @current_person = person
	end

	def current_person
	  @current_person ||= person_from_remember_token
	end
	
	def current_person?(person)
	  person == current_person
	end

	def person_from_remember_token
	  remember_token = cookies[:remember_token]
	  Person.find_by_remember_token(remember_token) unless remember_token.nil?
	end

	def signed_in?
	  !current_person.nil?
	end
	
	def deny_access
	  flash[:notice] = "Please sign in to access this page."
          redirect_to signin_path
	end
	
	

end
