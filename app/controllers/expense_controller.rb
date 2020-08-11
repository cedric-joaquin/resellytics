class ExpenseController < ApplicationController

    get '/expenses' do
        redirect '/' if !logged_in?
        @expenses = User.find(session[:user_id]).expenses

        erb :'/expenses/index'
    end
    
    get '/expenses/new' do
        redirect '/' if !logged_in?
        erb :'/expenses/create'
    end

    get '/expenses/:id' do
        redirect '/' if !logged_in?

        @expense = Expense.find(params[:id])
        #Redirects back to inventory page if expense from URL does not belong to logged in user
        redirect '/expenses' if !User.find(session[:user_id]).expenses.include?(@expense)

        erb :'/expenses/show'
    end

    get '/expenses/:id/edit' do
        @expense = Expense.find(params[:id])
        redirect '/expenses' if !User.find(session[:user_id]).expenses.include?(@expense)
        
        erb :'/expenses/update'
    end

    patch '/expenses/:id' do
        expense = Expense.find(params[:id])
        expense.update(
            name: params[:name],
            category: params[:category],
            cost: params[:cost],
            purchased_from: params[:purchased_from],
            purchase_date: params[:purchase_date].to_date.strftime('%B %d, %Y')
        )

        redirect "/expenses/#{expense.id}"
    end

    post '/expenses' do
        date = DateTime.parse(params[:purchase_date]).to_date
        params[:purchase_date] = date.strftime('%B %d, %Y')
        expense = Expense.create(params)
        User.find(session[:user_id]).expenses << expense
        redirect "/expenses/#{expense.id}"
    end

    delete '/expenses/:id' do
        Expense.find(params[:id]).destroy

        redirect '/expenses'
    end
end