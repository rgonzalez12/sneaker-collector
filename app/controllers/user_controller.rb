class UserController < ApplicationController
  
  get '/registrations/new' do
    
  end
  
  post '/registrations/new' do
    
  end
  
  get '/login' do
    if !logged_in?
     erb :'/users/login'
    else
     redirect '/users/home'
    end
  end
  
  post '/login' do
    login(params[:username], params[:password])
    current_user
    redirect to '/users/home'
  end
  
  post '/logout' do
    
  end
  
end