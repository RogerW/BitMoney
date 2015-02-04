class Account::TransfersController < ApplicationController
  before_action :authenticate_user!
  include Pundit
  
  def new
    build_account_transfer
  end

  def create
    build_account_transfer
    authorize @account_transfer
    if @account_transfer.save
      redirect_to :back, :notice => "Money transfered successfully"
    else
      render :new
    end
  end
  
  private
  
  def build_account_transfer
    @account_transfer ||= Account::Transfer.new(account_transfer_param)
  end
  
  def account_transfer_param
    account_transfer_param = params[:account_transfer]
    account_transfer_param[:account_id] = params[:account_id]
    account_transfer_param ? account_transfer_param.permit(:account_id, :destination_id, :amount, :note) : {}
  end
  
end