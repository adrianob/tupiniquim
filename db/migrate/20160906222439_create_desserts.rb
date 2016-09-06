class CreateDesserts < ActiveRecord::Migration[5.0]
  def change
    create_table :desserts do |t|
      t.text :description

      t.timestamps
    end
  end
end
