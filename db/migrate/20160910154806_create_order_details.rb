class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.references :order
      t.references :menu_item, null: false
      t.references :dessert
      t.references :drink

      t.timestamps
    end
  end
end
