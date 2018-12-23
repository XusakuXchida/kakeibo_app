class HistoriesController < ApplicationController
  def index
    @today = Date.today
  end

  def show
    year_month = params[:id].split("-")
    @year = year_month[0]
    @month = year_month[1]
    @accounts = Account.search_by_year_and_month(@year, @month)
    set_sum_money
  end

  private

    def set_sum_money
      @sum_money = 0
      @sum_money_red = 0
      @sum_money_yellow = 0
      @sum_money_green = 0
    end
end
