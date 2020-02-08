class UserController < ApplicationController
  
  get '/user/:id/home' do
    @user = User.find_by_id(params[:user_id])
    erb :'/users/home'
  end
  
  get '/registrations/new' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/user/:id/home'
   end
  end
  
  post '/registrations/new' do
    if params[:first_name] == "" || params[:last_name] == "" || params[:email_address] == "" || params[:password] == ""
      redirect '/registrations/new'
    else
      @user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :email_address => params[:email_address], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/user/:id/home'
    end
  end
  
  get '/login' do
    if !logged_in?
     erb :'/users/login'
    else
     redirect '/user/:id/home'
    end
  end
  
  post '/login' do
    login(params[:email_address], params[:password])
    current_user
    redirect '/user/:id/home'
  end
  
  post '/logout' do
    if logged_in?
     logout!
     redirect to '/login'
    else
     redirect to '/'
    end
  end
  
end