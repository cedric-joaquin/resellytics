class Expense < ActiveRecord::Base
    belongs_to :user

    def self.total
        self.all.collect do |expense|
            expense.cost
        end.inject(:+)
    end
end