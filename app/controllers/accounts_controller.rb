class AccountsController < ApplicationController
  def index
    @today = Date.today
    beginning_of_month = @today.beginning_of_month
    @accounts = Account.all.search_by_month(beginning_of_month)
    @sum_money = 0
    @sum_money_red = 0
    @sum_money_yellow = 0
    @sum_money_green = 0

    @categories = Category.all
  end

  def create
    account = Account.new
    account.date = params[:date]
    account.category = params[:category]
    account.purpose = params[:purpose]
    account.money = params[:money]
    if account.save
      redirect_to accounts_path
    else
      redirect_to "/home"
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    account = Account.find(params[:id])
    account.date = params[:date]
    account.category = params[:category]
    account.purpose = params[:purpose]
    account.money = params[:money]
    if account.save
      redirect_to accounts_path
    else
      redirect_to "/home"
    end
  end

  def destroy
    account = Account.find(params[:id])
    account.destroy
    redirect_to accounts_path
  end
end
