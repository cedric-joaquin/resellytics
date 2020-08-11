class Item < ActiveRecord::Base
    belongs_to :user

    def self.total(user_id)
        Item.all.select{|i|i.user_id == user_id}.collect do |item|
            item.cost
        end.inject(:+)
    end
end