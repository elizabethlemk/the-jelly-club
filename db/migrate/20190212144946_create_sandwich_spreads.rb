class CreateSandwichSpreads < ActiveRecord::Migration[5.2]
  def change
    create_table :sandwich_spreads do |t|
      t.integer :spread_id
      t.integer :sandwich_id
    end
  end
end
