class Expense < ActiveRecord::Base
    belongs_to :user

    def self.total(user_id)
        Expense.all.select{|e|e.user_id == user_id}.collect do |expense|
            expense.cost
        end.inject(:+)
    end
end