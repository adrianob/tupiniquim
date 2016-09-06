class CreateRestaurantTables < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_tables do |t|
      t.timestamps
    end
  end
end
