class ItemController < ApplicationController

    get '/items' do
        redirect '/' if !logged_in?
        @items = User.items

        erb :'/items/index'
    end

end