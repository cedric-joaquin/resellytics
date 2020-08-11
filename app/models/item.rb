class Item < ActiveRecord::Base
    belongs_to :user

    def self.total
        Item.all.collect do |item|
            item.cost
        end.inject(:+)
    end
end