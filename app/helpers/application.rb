helpers do
	API_KEY = ENV['MAILGUN_API_KEY']
	API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/morning-badlands-8105.herokuapp.com"

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end

	def send_simple_message(email, password_token)
		RestClient.post API_URL+"/messages"
		:from => email, 
		:to => , 
		:subject => "Recovery password", 
		:text => "Here is your #{password_token}"
	end

end