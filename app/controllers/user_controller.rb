class UserController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        user = User.find_by(email: params[:email])

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
        if !User.all.collect{|u|u.username}.include?(params[:username]) && !User.all.collect{|u|u.email}.include?(params[:email]) && user.save
            session[:user_id] = user.id
            binding.pry
            redirect '/dashboard'
        else
            erb :signup
        end
    end

    get '/logout' do
        session.clear

        redirect '/'
    end

end