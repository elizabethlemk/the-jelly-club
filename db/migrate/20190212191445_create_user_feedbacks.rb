class CreateUserFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_feedbacks do |t|
      t.integer :user_id
      t.integer :feedback_id
      t.string :comment
      t.integer :rating
    end
  end
end
