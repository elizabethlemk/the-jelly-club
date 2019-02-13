class CreateUserFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_feedbacks do |t|
      t.integer :user_id
      t.integer :sandwich_id
      t.string :comment
      t.boolean :favorite
    end
  end
end
