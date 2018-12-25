class AccountsController < ApplicationController
  def index
    @today = Date.today
    @year = @today.year
    @month = @today.month
    @accounts = Account.all.search_by_month(@today.beginning_of_month)
    set_sum_money

    @categories = Category.all
  end

  def create
    @account = Account.new
    get_params
    if @account.save
      redirect_to accounts_path
    else
      redirect_to "/home"
    end
  end

  def edit
    @account = Account.find(params[:id])
    @categories = Category.all
  end

  def update
    @account = Account.find(params[:id])
    get_params
    if @account.save
      redirect_to history_path("#{@account.year}-#{@account.month}")
    else
      redirect_to "/home"
    end
  end

  def destroy
    account = Account.find(params[:id])
    account.destroy
    redirect_to accounts_path
  end

  private

    def set_sum_money
      @sum_money = 0
      @sum_money_red = 0
      @sum_money_yellow = 0
      @sum_money_green = 0
    end

    def get_params
      @account.date = params[:date]
      @account.year = params[:date].to_date.year
      @account.month = params[:date].to_date.month
      @account.day = params[:date].to_date.day
      @account.category = params[:category]
      @account.purpose = params[:purpose]
      @account.money = params[:money]
    end
end
