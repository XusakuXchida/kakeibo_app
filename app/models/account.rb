class Account < ApplicationRecord
  validates :date, presence: true
  validates :category, presence: true
  validates :purpose, presence: true
  validates :money, presence: true
  default_scope -> { order(date: :asc) }

  scope :search_by_month, ->(beginning_of_month) {
    where('date >= ?', beginning_of_month)
  }

  scope :search_by_year_and_month, ->(year, month) {
    where(year: year).where(month: month)
  }

  scope :total_amount, -> {
    pluck(:money).sum
  }

  scope :only_green, -> {
    where(purpose: "仕事・勉強")
  }

  scope :only_yellow, -> {
    where(purpose: "生活費")
  }

  scope :only_red, -> {
    where(purpose: "趣味・娯楽")
  }

end
