helpers do
	API_KEY = ENV['MAILGUN_API_KEY']
	API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/app29425854.mailgun.org"

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end

	def send_token_email(user_email, password_token)
		RestClient.post API_URL+"/messages",
		:from => "postmaster@app29425854.mailgun.org", 
		:to => user_email, 
		:subject => "Recovery password", 
		:text => "Please click following link to recover your password: http://morning-badlands-8105.herokuapp.com/users/reset_password/#{password_token}"
	end

# def send_simple_message
#   RestClient.post "https://api:key-89dd848a009a60085d893cd7969927c5"\
#   "@api.mailgun.net/v2/sandbox4801168f0ad04a3f971855626dc873ba.mailgun.org/messages",
#   :from => "mihai@makersacedemy.com",
#   :to => "cmihailiviu@gmail.com",
#   :subject => "Hello",
#   :text => "Check out this link:"
# end


end