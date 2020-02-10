class PortfolioController < ApplicationController
  
  get '/leaderboard' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/sneakers/leaderboard'
    end
  end
  
  get '/portfolio/:id' do
    erb :'/sneakers/portfolio_list'
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