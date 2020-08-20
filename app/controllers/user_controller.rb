class UserController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            login(user)
        else
            redirect '/login'
        end
    end

    get '/signup' do
        erb :signup
    end

    post '/signup' do
        user = User.new(params)
        if !User.find_by(username: params[:username]) && !User.find_by(email: params[:email]) && user.save
            login(user)
        else
            erb :signup
        end
    end

    get '/logout' do
        session.clear

        redirect '/'
    end

end