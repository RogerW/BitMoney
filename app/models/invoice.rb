class Invoice < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many  :consumption_types
  attr_accessor :consumption_type_id
  
  validate :consumption_type_user

  before_destroy :return_money
  
  before_update :change_money, :if => :amount_cents_changed?
  before_update :change_consuption_type_id

  enum invtype: [:add_fund, :withdrawal]
  
  monetize :amount_cents, with_model_currency: :amount_currency
  
  private
  
  def return_money
    if self.invtype == :add_fund
      self.account.update_attributes!(balance: self.account.balance - Money.new(self.amount_cents, account.balance.currency))
    else
      self.account.update_attributes!(balance: self.account.balance + Money.new(self.amount_cents, account.balance.currency))
    end
  end
  
  def change_money
  end
  
  def change_consuption_type_id
    unless self.consumption_types.empty?
      self.consumption_types = [ConsumptionType.find(self.consumption_type_id)]
    else
      self.consumption_types << ConsumptionType.find(self.consumption_type_id)
    end
  end
  
  def consumption_type_user
    if self.account.user_id != ConsumptionType.find(self.consumption_type_id).user_id
      errors.add(:consumption_type_id, "Consumption Type is not exist!")
    end
  end
  
end
