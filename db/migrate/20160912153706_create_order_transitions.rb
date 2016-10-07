class CreateOrderTransitions < ActiveRecord::Migration
  def change
    create_table :order_detail_transitions do |t|
      t.string :to_state, null: false
      t.json :metadata, default: {}
      t.integer :sort_key, null: false
      t.integer :order_detail_id, null: false
      t.boolean :most_recent, null: false
      t.timestamps null: false
    end

    add_index(:order_detail_transitions,
              [:order_detail_id, :sort_key],
              unique: true,
              name: "index_order_detail_transitions_parent_sort")
    add_index(:order_detail_transitions,
              [:order_detail_id, :most_recent],
              unique: true,
              where: 'most_recent',
              name: "index_order_detail_transitions_parent_most_recent")
    remove_column :orders, :state
  end
end
