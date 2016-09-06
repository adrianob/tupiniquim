class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :password
      t.text :cpf
      t.string :type

      t.timestamps
    end
  end
end
