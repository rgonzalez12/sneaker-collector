class PortfolioController < ApplicationController
  
  get '/leaderboard' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/sneakers/leaderboard'
    end
  end
  
  get '/portfolio/:id' do
    if session[:id] = current_user.id
      erb :'/sneakers/portfolio_list'
    else 
      redirect "/portfolio/#{current_user.id}"
    end
  end
  
  get '/portfolio/:id/new_sneaker' do
    erb :'/sneakers/create_sneaker'
  end
  
  post '/portfolio/:id/:sneaker_id' do
    
  end

  get '/portfolio/sneakers/:id/edit' do
    erb :'/sneakers/edit_sneaker'
  end

  patch '/portfolio/sneakers/:id/edit' do
   
  end

  delete '/portfolio/sneakers/:id/delete' do
    
  end
  
end