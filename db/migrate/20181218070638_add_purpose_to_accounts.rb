class AddPurposeToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :purpose, :string
  end
end
