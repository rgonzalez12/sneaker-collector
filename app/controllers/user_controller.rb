class UserController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
end