class AddYearMonthDayToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :year, :integer
    add_column :accounts, :month, :integer
    add_column :accounts, :day, :integer
  end
end
