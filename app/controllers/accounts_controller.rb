class AccountsController < ApplicationController
  def index
    @today = Date.today
    beginning_of_month = @today.beginning_of_month
    @accounts = Account.all.search_by_month(beginning_of_month)
    @sum_money = 0
  end

  def create
    account = Account.new
    account.date = params[:date]
    account.category = params[:category]
    account.purpose = params[:purpose]
    account.money = params[:money]
    if account.save
      redirect_to action: "index"
    else
      redirect_to "/home"
    end
  end
end
