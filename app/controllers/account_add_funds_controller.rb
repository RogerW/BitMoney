class AccountAddFundsController < ApplicationController
    before_action :authenticate_user!

    def new
        build_account_add_fund
    end
    
    def create
        build_account_add_fund
        if @add_funds.save
            redirect_to :back, :notice => "Money deposited successfully"
        else
            redirect_to :new
        end
    end
    
    private
    
    def build_account_add_fund
        @add_funds ||= AccountAddFund.new(account_add_fund_param)
    end
    
    def account_add_fund_param
        account_add_fund_param = params[:add_funds]
        account_add_fund_param ? account_add_fund_param.permit(:id, :amount, :note) : {}
    end
end