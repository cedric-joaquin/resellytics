class ExpenseController < ApplicationController

    get '/expenses' do
        redirect?
        @expenses = current_user.expenses

        erb :'/expenses/index'
    end
    
    get '/expenses/new' do
        redirect?
        erb :'/expenses/create'
    end

    get '/expenses/:id' do
        redirect?

        @expense = Expense.find_by(params[:id])
        #Redirects back to inventory page if expense from URL does not belong to logged in user
        redirect '/expenses' if !current_user.expenses.include?(@expense)

        erb :'/expenses/show'
    end

    get '/expenses/:id/edit' do
        redirect?
        @expense = Expense.find_by(params[:id])
        redirect '/expenses' if !current_user.expenses.include?(@expense)
        
        erb :'/expenses/update'
    end

    patch '/expenses/:id' do
        expense = Expense.find_by(params[:id])
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
        current_user.expenses << expense
        redirect "/expenses/#{expense.id}"
    end

    delete '/expenses/:id' do
        Expense.find_by(params[:id]).destroy

        redirect '/expenses'
    end
end