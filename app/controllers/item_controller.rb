class ItemController < ApplicationController

    get '/items' do
        redirect?
        @items = current_user.items

        erb :'/items/index'
    end
    
    get '/items/new' do
        redirect?
        erb :'/items/create'
    end

    get '/items/:id' do
        redirect?

        @item = current_user.items.find_by(id: params[:id])
        #Redirects back to inventory page if item from URL does not belong to logged in user
        redirect '/items' if !@item

        erb :'/items/show'
    end

    get '/items/:id/edit' do
        redirect?
        @item = current_user.items.find_by(id: params[:id])
        redirect '/items' if !@item
        
        erb :'/items/update'
    end

    patch '/items/:id' do
        if item = current_user.items.find_by(id: params[:id])
            item.update(
                name: params[:name],
                brand: params[:brand],
                size: params[:size],
                cost: params[:cost],
                purchased_from: params[:purchased_from],
                purchase_date: params[:purchase_date].to_date.strftime('%B %d, %Y')
            )
        end
        redirect "/items/#{item.id}"
    end

    post '/items' do
        date = DateTime.parse(params[:purchase_date]).to_date
        params[:purchase_date] = date.strftime('%B %d, %Y')
        item = Item.create(params)
        current_user.items << item
        redirect "/items/#{item.id}"
    end

    delete '/items/:id' do
        if item = current_user.items.find_by(id: params[:id])
            item.destroy
        end

        redirect '/items'
    end
end