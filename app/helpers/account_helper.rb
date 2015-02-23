module AccountHelper

  def add_consumption
    @add_consumption ||= Account::AddConsumption.new
  end

  def add_fund
    @add_fund ||= Account::AddFund.new
  end

  def user_invoices
    @user_invoices = current_user.invoices.all
  end
end


