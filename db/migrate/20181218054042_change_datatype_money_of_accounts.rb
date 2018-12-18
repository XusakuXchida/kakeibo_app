class ChangeDatatypeMoneyOfAccounts < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :money, :integer
  end
end
