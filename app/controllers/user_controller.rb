class UserController < ApplicationController
  
  get '/registrations/new' do
    erb :'/users/signup'
  end
  
  post '/registrations/new' do
    if params[:first_name] == "" || params[:last_name] == "" || params[:email_address] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.new(:first_name => params[:first_name], :email_address => params[:email_address], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect ''
    end
  end
  
  get '/login' do
    if !logged_in?
     erb :'/users/login'
    else
     redirect '/users/:id/home'
    end
  end
  
  post '/login' do
    login(params[:email_address], params[:password])
    current_user
    redirect '/users/:id/home'
  end
  
  post '/logout' do
    
  end
  
end