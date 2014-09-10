get '/users/new' do
	@user = User.new
	erb :"users/new"
end

post '/users' do
	@user = User.create(:email => params[:email],
							:password => params[:password], 
							:password_confirmation => params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :"users/new"
	end
end

get '/users/password_reset_request' do 
	erb :"users/password_reset_request"
end

post '/users/password_reset_request' do 
	user = User.first(:email => params[:email])
	user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
	user.password_token_timestamp = Time.now
	user.save
	send_token_email(params[:email], user.password_token)
	flash[:notice] = "Please check your email to complete password reset"
	redirect to 'sessions/new'
end

get '/users/password_reset_confirmation/:token' do 
	erb :"users/password_reset_confirmation"
end

post '/users/password_reset_confirmation' do 
	user = User.first(:password_token => params[:token])
	user.password=(params[:password])
	flash[:notice] = "Your password has been reset, please sign in"
	redirect to 'sessions/new'
end