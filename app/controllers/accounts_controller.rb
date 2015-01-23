class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    load_accounts
  end

  def show
    @add_funds ||= AccountAddFund.new()
    load_account or redirect_to :accounts, alert: t(:could_not_find_account_text)
  end

  def new
    build_account
  end
  
  def edit
    load_account or redirect_to :accounts, alert: t(:could_not_find_account_text)
    build_account
  end
  
  def create
    build_account
    flash[:notice] = t(:create_account_successful_text)
    save_account or render :new 
  end
  
  def update
    load_account
    build_account
    flash[:notice] = 'Account updated'
    save_account or render :edit, notice: t(:could_not_find_account_text)
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
    @account ||= account_scope.where(id: params[:id]).first
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
    if current_user.admin?
      
      if account_params
        account_params[:user_id].nil? ? account_params[:user_id] = current_user.id : {}
      end
      
      account_params ? account_params.permit(:title, :description, :user_id) : {}
    else
      account_params ? account_params.permit(:title, :description) : {}
    end
    
    
  end
  
  def account_scope
    current_user.admin? ? Account.where(nil) : current_user.accounts
  end
  
end
