class CreateSandwiches < ActiveRecord::Migration[5.2]
  def change
    create_table :sandwiches do |t|
      t.string :name
      t.integer :user_id
      t.integer :bread_id
      t.boolean :delicious

      t.timestamps
    end
  end
end
