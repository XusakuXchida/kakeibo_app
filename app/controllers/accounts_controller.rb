class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def create
  end
end
