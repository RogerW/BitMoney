class AccountController < ApplicationController
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
    @notes ||= account_scope.to_a
  end
  
  def load_account
    @note ||= accout_scope.find(params[:id])
  end
  
  def build_account
    @note ||= accout_scope.build
    @note.attributes = account_params
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
  
  def accout_scope
    current_user.admin? ? Account.scoped : current_user.accounts
  end
  
end
