class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    @sum_money = 0
  end

  def create
    account = Account.new
    account.date = params[:date]
    account.category = params[:category]
    account.money = params[:money]
    account.save
    redirect_to action: "index"
  end
end
