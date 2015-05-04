class Account::AddFundsController < ApplicationController
  before_action :authenticate_user!

  def new
    build_account_add_fund
  end
    
  def create
    build_account_add_fund
    if @add_fund.save
      render json: @add_fund, status: 200
    else
      render json: @add_fund, status: 500
    end
  end
    
  private
    
  def build_account_add_fund
    @add_fund ||= Account::AddFund.new(account_add_fund_param)
  end
    
  def account_add_fund_param
    account_add_fund_param = params[:account_add_fund]
    account_add_fund_param[:account_id] ? {} :account_add_fund_param[:account_id] = params[:account_id]
    account_add_fund_param ? account_add_fund_param.permit(:account_id, :amount, :note) : {}
  end
end