class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

    end

    add_index :users, :email,                unique: true
  end

end
