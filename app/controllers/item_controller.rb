class ItemController < ApplicationController

    get '/items' do
        redirect '/' if !logged_in?
        @items = User.find(session[:user_id]).items

        erb :'/items/index'
    end
    
    get '/items/new' do
        redirect '/' if !logged_in
        erb :'/items/create'
    end

    get '/items/:id' do
        redirect '/' if !logged_in?
        @item = Item.find(params[:id])

        erb :'/items/show'
    end

    post '/items' do


    end


end