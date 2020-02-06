require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Eu7*Ke?4Dn-7*$CB"
  end

  get "/" do
    erb :welcome
  end

end
