class UserController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/dashboard'
        else
            redirect '/login'
        end
    end

    get '/signup' do
        erb :signup
    end

    post '/signup' do
        user = User.new(params)
        
        if user.save
            session[:user_id] = user.id
            redirect '/dashboard'
        else
            erb :signup
        end
    end


end