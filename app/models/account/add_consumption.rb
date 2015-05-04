class Account::AddConsumption < ActiveType::Object
  attribute :account_id, :integer
  attribute :consumption_type_id, :integer
  attribute :amount, :string
  attribute :note, :string
  
  belongs_to :account, class_name: 'Account'
  belongs_to :consumption_type, class_name: 'ConsumptionType'
  
  validate :has_money?
  validate :consumption_type_user
  validates_presence_of :account_id, :consumption_type_id, :amount
  
  after_save :withdrawal
  after_save :create_withdrawal_invoice
  after_save :create_consumption
  
  private
  
  def consumption_type_user
    if account.user_id != consumption_type.user_id
      errors.add(:consumption_type_id, "Consumption Type is not exist!")
    end
  end
  
  def has_money?
    if account.balance < Money.new(amount*100, account.balance.currency)
      errors.add(:amount, "Not enough money")
    end
  end
  
  def withdrawal
    account.update_attributes!(balance: account.balance - Money.new(amount*100, account.balance.currency))
  end
  
  def create_withdrawal_invoice
    @invoice = account.invoices.create(amount_cents: amount*100, amount_currency: account.balance.currency.iso_code, note: note, invtype: Invoice.invtypes[:withdrawal])
  end
  
  def create_consumption
    @invoice.consumptions.create(consumption_type_id: consumption_type_id)
  end
  
end
