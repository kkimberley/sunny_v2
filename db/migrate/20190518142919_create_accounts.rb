class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :type
      t.integer :amount
      t.datetime :day
      t.string :note
      t.string :context

      t.timestamps
    end
  end
end
