class UserController < ApplicationController

    get '/login' do
        erb :login
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