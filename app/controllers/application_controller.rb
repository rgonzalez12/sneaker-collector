require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Eu7*Ke?4Dn-7*$CB"
  end

  get "/" do
    if !logged_in?
     erb :welcome
    else
     redirect "/user/home/#{current_user.id}"
   end
  end
  
  helpers do

   def current_user
     @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
   end
   
   def logged_in?
     !!current_user
   end
   
   def login(email_address, password)
    user = User.find_by(:email_address => email_address) 
     if user && user.authenticate(password)
      session[:user_id] = user.id
     else
      redirect "/login"
     end
   end
   
   def redirect_if_not_logged_in
     redirect '/login' if !logged_in?
   end

  end

end
