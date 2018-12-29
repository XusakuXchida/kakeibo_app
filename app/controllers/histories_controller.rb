class HistoriesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.js
    end

    @today = Date.today

    @recently_ym = []
    @recently = []
    @hash_sums = {}
    @hash_sums["sums"] = []
    @hash_sums["sums_red"] = []
    @hash_sums["sums_yellow"] = []
    @hash_sums["sums_green"] = []
    13.times do |i|
      year = (@today - i.month).year
      month = "%02d" % (@today - i.month).month
      sum = Account.search_by_year_and_month(year, month).total_amount
      @recently_ym << [year, month, sum]
      @recently << "#{year}年 #{month}月"
      @hash_sums["sums"] << sum
      @hash_sums["sums_red"] << Account.search_by_year_and_month(year, month).only_red.total_amount
      @hash_sums["sums_yellow"] << Account.search_by_year_and_month(year, month).only_yellow.total_amount
      @hash_sums["sums_green"] << Account.search_by_year_and_month(year, month).only_green.total_amount
    end
    gon.labels = @recently.reverse
    gon.sums = @hash_sums["sums"].reverse
    gon.sums_red = @hash_sums["sums_red"].reverse
    gon.sums_yellow = @hash_sums["sums_yellow"].reverse
    gon.sums_green = @hash_sums["sums_green"].reverse
    gon.sums_max = @hash_sums["sums"] .max
  end

  def show
    @categories = Category.all
    begin
      @today = Date.today
      year_month = params[:id].split("-")
      @year = year_month[0]
      @month = year_month[1]
      @current_date = "#{@year}/#{@month}/1".to_date
      if @today < @current_date || @current_date < @today.ago(10.year)
        redirect_to accounts_path
      end

      @prev_m = @current_date.prev_month
      @next_m = @current_date.next_month
      @accounts = Account.search_by_year_and_month(@year, @month)
      set_sum_money
    rescue
      redirect_to accounts_path
    end
  end

  private

    def set_sum_money
      @sum_money = @accounts.total_amount
      @sum_money_red = @accounts.only_red.total_amount
      @sum_money_yellow = @accounts.only_yellow.total_amount
      @sum_money_green = @accounts.only_green.total_amount
    end
end
