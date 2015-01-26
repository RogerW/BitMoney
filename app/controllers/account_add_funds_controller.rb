class AccountAddFundsController < ApplicationController
    before_action :authenticate_user!

    def new
        build_account_add_fund
    end
    
    def create
        build_account_add_fund
        if @add_fund.save
            redirect_to :back, :notice => "Money deposited successfully"
        else
            redirect_to :new
        end
    end
    
    private
    
    def build_account_add_fund
        @add_fund ||= AccountAddFund.new(account_add_fund_param)
    end
    
    def account_add_fund_param
        account_add_fund_param = params[:account_add_fund]
        account_add_fund_param[:account_id] = params[:account_id]
        account_add_fund_param ? account_add_fund_param.permit(:account_id, :amount, :note) : {}
    end
end