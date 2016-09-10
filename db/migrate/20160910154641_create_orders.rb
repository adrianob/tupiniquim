class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :restaurant_table, references: :users, null: false
      t.references :waiter, references: :users, null: false
      t.text :state

      t.timestamps
    end
  end
end
