class HistoriesController < ApplicationController
  def index
    @today = Date.today
  end

  def show
    @accounts = Account.find(params[:id])
  end
end
