class CreateClientOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :client_orders do |t|
      t.references :user
      t.references :menu_item
      t.references :dessert
      t.references :drink
      t.references :restaurant_table
      t.references :waiter, references: :users, null: false
      t.text :state

      t.timestamps
    end
  end
end
