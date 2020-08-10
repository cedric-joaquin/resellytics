class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :cost
      t.string :category
      t.string :purchased_from
      t.string :purchase_date
      t.integer :user_id
      t.timestamps
  end
end
