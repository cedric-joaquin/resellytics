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
    redirect?
    @user = current_user

    erb :dashboard
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def login(user)
      session[:user_id] = user.id
      redirect '/dashboard'
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect?
      if !logged_in?
        redirect '/'
      end
    end

    def total(query)
      current_user.send(query).collect{|item| item.cost}.inject(0,:+)
    end
  end

end
