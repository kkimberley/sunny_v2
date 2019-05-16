class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :price
      t.integer :number
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
