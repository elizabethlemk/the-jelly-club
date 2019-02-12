class CreateSpreads < ActiveRecord::Migration[5.2]
  def change
    create_table :spreads do |t|
      t.string :name
    end
  end
end
