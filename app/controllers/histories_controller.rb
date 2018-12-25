class HistoriesController < ApplicationController
  def index
    @today = Date.today
  end

  def show
    begin
      @today = Date.today
      year_month = params[:id].split("-")
      @year = year_month[0]
      @month = year_month[1]
      current_date = "#{@year}/#{@month}/1".to_date
      if @today < current_date || current_date < @today.ago(10.year)
        redirect_to accounts_path
      end

      @prev_m = current_date.prev_month
      @next_m = current_date.next_month
      @accounts = Account.search_by_year_and_month(@year, @month)
      set_sum_money
    rescue
      redirect_to accounts_path
    end
  end

  private

    def set_sum_money
      @sum_money = 0
      @sum_money_red = 0
      @sum_money_yellow = 0
      @sum_money_green = 0
    end
end
