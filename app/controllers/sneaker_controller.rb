class SneakerController < ApplicationController
  
  get '/sneakers/new' do
    if logged_in?
      erb :'/sneakers/create_sneaker'
    else
      redirect "/login"
    end
  end
  
  post '/sneakers' do
    @sneaker = current_user.sneakers.build(manufacturer: params[:manufacturer], model: params[:model], size_us: params[:size_us], colorway: params[:colorway], condition: params[:condition], est_value: params[:est_value], notes: params[:notes])
    if @sneaker.save
      redirect "/portfolio/#{current_user.id}"
    else
      redirect '/login'
    end
  end

  get '/sneakers/:id/edit' do
    @sneaker = Sneaker.find(params[:id])
    #if logged_in? && current_user.id == @user.portfolios
     erb :'/sneakers/edit_sneaker'
   #else
     #redirect '/portfolio/#{current_user.portfolio.id}'
  # end
  end

  patch '/sneakers/:id' do
  
  end

  delete '/sneakers/:id' do
    @sneaker = Sneaker.find_by(id: params[:id])
    if logged_in?
      binding.pry
      if @sneaker && @sneaker.user == current_user
         @sneaker.delete
        redirect to "/portfolio/#{current_user.portfolio.id}"
      else
        redirect to '/login'
      end
    end
  end
  
end