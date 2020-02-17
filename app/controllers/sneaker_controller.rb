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

  get '/portfolio/sneakers/:id/edit' do
    @sneaker = Sneaker.find_by_id(params[:id])
    if logged_in? && current_user == @sneaker.user
     erb :'/sneakers/edit_sneaker'
   else
     redirect "/portfolio/#{current_user.portfolio.id}"
   end
  end

  patch '/portfolio/sneakers/:id' do
    if logged_in?
      if params[:manufacturer] == "" || params[:model] == "" || params[:size_us] == "" || params[:colorway] == "" || params[:est_value] == "" || params[:condition] == "" || params[:notes] == ""
        redirect to "/shows/#{params[:id]}/edit"
      else
        @show = Show.find_by_id(params[:id])
          if @show && @show.user == current_user
            if @show.update(title: params[:title], rating: params[:rating], streaming_service: params[:streaming_service], review: params[:review])
              redirect to "/shows/#{@show.id}"
            else
              redirect to "/shows/#{@shows.id}/edit"
            end
          else
            redirect to '/shows'
          end
        end
      else
        redirect to '/login'
      end
  
  end

  delete '/portfolio/sneakers/:id/delete' do
    @sneaker = Sneaker.find_by_id(params[:id])
    if logged_in?
      if @sneaker && @sneaker.user == current_user
         @sneaker.delete
        redirect to "/portfolio/#{current_user.id}"
      else
        redirect to '/login'
      end
    end
  end
  
end