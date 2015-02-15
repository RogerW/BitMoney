module AccountHelper

  def add_consumption
    @add_consumption ||= Account::AddConsumption.new
  end

  def add_fund
    @add_fund ||= Account::AddFund.new
  end
end
