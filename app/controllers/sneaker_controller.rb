class SneakerController < ApplicationController
  
  get '/sneakers/new' do
    redirect_if_not_logged_in
    erb :'/sneakers/create_sneaker'
  end
  
  post '/sneakers' do
    if logged_in?
      if params[:manufacturer] == "" || params[:model] == "" || params[:size_us] == "" || params[:colorway] == "" || params[:est_value] == "" || params[:condition] == "" || params[:notes] == ""
      redirect '/sneakers/new'
      else
       @sneaker = current_user.sneakers.build(manufacturer: params[:manufacturer], model: params[:model], size_us: params[:size_us], colorway: params[:colorway], condition: params[:condition], est_value: params[:est_value], notes: params[:notes])
        if @sneaker.save
          redirect "/portfolio/#{current_user.id}"
        else
          redirect to '/sneakers/new'
        end
      end
    else
      redirect '/login'
    end
  end

  get '/portfolio/sneakers/:id/edit' do
    @sneaker = Sneaker.find_by_id(params[:id])
    if logged_in? && current_user == @sneaker.user
     erb :'/sneakers/edit_sneaker'
   else
     redirect "/portfolio/#{current_user.id}"
   end
  end

  patch '/portfolio/sneakers/:id' do
    if logged_in?
      if params[:manufacturer] == "" || params[:model] == "" || params[:size_us] == "" || params[:colorway] == "" || params[:est_value] == "" || params[:condition] == "" || params[:notes] == ""
        redirect to "/portfolio/sneakers/#{params[:id]}/edit"
      else
        @sneaker = Sneaker.find_by_id(params[:id])
          if @sneaker && @sneaker.user == current_user
            if @sneaker.update(manufacturer: params[:manufacturer], model: params[:model], size_us: params[:size_us], colorway: params[:colorway], condition: params[:condition], est_value: params[:est_value], notes: params[:notes])
              redirect to "/portfolio/#{current_user.id}"
            else
              redirect to "/portfolio/sneakers/#{params[:id]}/edit"
            end
          else
            redirect to "/portfolio/#{current_user.id}"
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