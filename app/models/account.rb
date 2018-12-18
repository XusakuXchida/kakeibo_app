class Account < ApplicationRecord
  validates :date, presence: true
  validates :category, presence: true
  validates :money, presence: true
  default_scope -> { order(date: :desc) }
end
