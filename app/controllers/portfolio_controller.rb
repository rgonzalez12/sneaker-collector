class PortfolioController < ApplicationController
  
  get '/leaderboard' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/sneakers/leaderboard'
    end
  end
  
  get '/portfolio/:id' do
    if Portfolio.find(params[:id]).user_id == current_user.id
      params[:id] == current_user.id
      erb :'/sneakers/portfolio_list'
    else 
      redirect "/portfolio/#{current_user.portfolio.id}"
    end
  end
  
  get '/portfolio/:id/new_sneaker' do
    if Portfolio.find(params[:id]).user_id == current_user.id
      params[:id] == current_user.id
      erb :'/sneakers/create_sneaker'
    else
      redirect "/portfolio/#{current_user.portfolio.id}/new_sneaker"
    end
  end
  
  post '/portfolio/:id/:sneaker_id' do
    @errors = []
    sneaker = Sneaker.new(manufacturer: params[:manufacturer], size_us: params[:size_us], model: params[:model], colorway: params[:colorway], condition: params[:condition], est_value: params[:est_value], notes: params[:notes])
    portfolio = Portfolio.find(params[:id])
    portfolio.sneakers << sneaker
    if portfolio.save
      redirect "/portfolio/#{current_user.portfolio.id}"
    else
      @errors = sneaker.errors.full_messages
    end
  end

  get '/portfolio/sneakers/:id/edit' do
    @sneaker = Sneaker.find(params[:id])
    #if logged_in? && current_user == @sneaker.user
    erb :'/sneakers/edit_sneaker'
  end

  patch '/portfolio/sneakers/:id/edit' do
   
  end

  delete '/portfolio/sneakers/:id/delete' do
     
  end
  
end