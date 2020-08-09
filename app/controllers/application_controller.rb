require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "JmPCuw6s"
  end

  get '/' do
    redirect '/dashboard' if logged_in?

    erb :welcome
  end

  get '/dashboard' do
    redirect '/' if !logged_in?

    erb :dashboard
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
