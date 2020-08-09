class ItemController < ApplicationController

    get '/items' do
        redirect '/' if !logged_in?
        @items = User.find(session[:user_id]).items

        erb :'/items/index'
    end
    
    get '/items/new' do
        redirect '/' if !logged_in?
        erb :'/items/create'
    end

    get '/items/:id' do
        redirect '/' if !logged_in?
        @item = Item.find(params[:id])

        erb :'/items/show'
    end

    get '/items/:id/edit' do
        @item = Item.find(params[:id])

        erb :'/items/update'
    end

    patch '/items/:id' do
        item = Item.find(params[:id])
        item.update(
            name: params[:name],
            brand: params[:brand],
            size: params[:size],
            item_cost: params[:item_cost],
            purchased_from: params[:purchased_from],
            purchase_date: params[:purchase_date]
        )

        redirect "/items/#{item.id}"
    end

    post '/items' do
        date = DateTime.parse(params[:purchase_date]).to_date
        params[:purchase_date] = date.strftime('%B %d, %Y')
        item = Item.create(params)
        User.find(session[:user_id]).items << item
        redirect "/items/#{item.id}"
    end


end