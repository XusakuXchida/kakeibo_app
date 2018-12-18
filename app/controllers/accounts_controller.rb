class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    @sum_money = 0

    @today = Date.today
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
