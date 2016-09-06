class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.text :details
      t.numeric :ambient_grade
      t.numeric :food_grade
      t.numeric :service_grade

      t.timestamps
    end
  end
end
