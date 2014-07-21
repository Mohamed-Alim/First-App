module SessionsHelper

	def sign_in(user)
		 cookies[:remember_token] = { value: user.remember_token, expires: 20.years.from_now }
		
	end
end
