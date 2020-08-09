class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :purchase_date
      t.string :name
      t.string :brand
      t.string :size
      t.string :purchased_from
      t.float :item_cost
      t.timestamps
  end
end
