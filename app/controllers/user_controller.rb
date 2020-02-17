class UserController < ApplicationController
  
  get '/user/home/:id' do
    if !logged_in?
      redirect '/login'
    else
      @user = User.find_by_id(params[:id])
      erb :'/users/home'
    end
  end
  
  get '/registrations/new' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to "/user/home/#{current_user.id}"
   end
  end
  
  post '/registrations/new' do
    if params[:first_name] == "" || params[:last_name] == "" || params[:email_address] == "" || params[:password] == ""
      redirect '/registrations/new'
    else
      @user = User.new(:first_name => params[:first_name], :last_name => params[:last_name], :email_address => params[:email_address], :password => params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect "/user/home/#{current_user.id}"
      else
        redirect '/registrations/new'
      end
    end
  end
  
  get '/portfolio/:id' do #users show action
    if User.find_by(params[:id]).id == current_user.id
      erb :'/users/portfolio_list'
    else 
      redirect "/portfolio/#{current_user.id}"
    end
  end
  
  get '/leaderboard' do
    @user = User.find_by_id(params[:id])
    if !logged_in?
      redirect '/login'
    else
      erb :'/sneakers/leaderboard'
    end
  end
  
  get '/login' do
    if !logged_in?
     erb :'/users/login'
    else
     redirect "/user/home/#{current_user.id}"
    end
  end
  
  post '/login' do
    login(params[:email_address], params[:password])
    current_user
    redirect "/user/home/#{current_user.id}"
  end
  
  post '/logout' do
   session.clear
   redirect '/login'
  end
  
end