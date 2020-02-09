class PortfolioController < ApplicationController
  
  get '/leaderboard' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/sneakers/leaderboard'
    end
  end
  
  get '/portfolio/:id' do
  
  end
  
  get '/portfolio/:id/new_sneaker' do
 
  end
  
  post '/portfolio/:id/new_sneaker' do
 
  end

  get '/portfolio/sneakers/:id/edit' do
 
  end

  patch '/portfolio/sneakers/:id/edit' do
   
  end

  delete '/portfolio/sneakers/:id/delete' do
    
  end
  
end