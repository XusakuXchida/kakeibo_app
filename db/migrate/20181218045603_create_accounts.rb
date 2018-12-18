class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.date :date
      t.string :category
      t.float :money

      t.timestamps
    end
  end
end
