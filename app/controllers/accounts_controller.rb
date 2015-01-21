class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    load_accounts
  end

  def show
    load_account
  end

  def new
    build_account
  end
  
  def edit
    load_account
    build_account
  end
  
  def create
    build_account
    save_account or render :new 
  end
  
  def update
    
  end
  
  def destroy
    load_account
    @account.destroy
    redirect_to accounts_path
  end
  
  private
  
  def load_accounts
    @accounts ||= account_scope.to_a
  end
  
  def load_account
    @account ||= account_scope.find(params[:id])
  end
  
  def build_account
    @account ||= account_scope.build
    @account.attributes = account_params
  end
  
  def save_account
    if @account.save
      redirect_to @account
    end
  end
  
  def account_params
    account_params = params[:account]
    account_params ? account_params.permit(:title, :description) : {}
  end
  
  def account_scope
    current_user.admin? ? Account.where(nil) : current_user.accounts
  end
  
end
