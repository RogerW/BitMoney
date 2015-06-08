class Account::Transfer < ActiveType::Object
  has_paper_trail
  
  attribute :account_id, :integer
  attribute :destination_id, :integer
  attribute :amount, :string
  attribute :note, :string

  # monetize :amount
    
  belongs_to :account, class_name: 'Account'
  belongs_to :destination, class_name: 'Account'
  
  validate :has_money?
  validate :equal_accounts?
  validate :currency_equal?
  validates_presence_of :account_id, :destination_id, :amount
  
  after_save :add_fund
  after_save :withdrawal
  after_save :create_add_fund_invoice
  after_save :create_withdrawal_invoice

  private
  
  def has_money?
    if account.balance < Money.new(amount*100, account.balance.currency)
      errors.add(:amount, "Not enough money")
    end
  end


  def equal_accounts?
    if account.id == destination.id
      errors.add(:destination_id, "Source and Destination Equal")
    end
  end

  def currency_equal?
	  errors.add(:destination_id, "Different currencies") if (account.balance.currency != destination.balance.currency )
  end
  
  def add_fund 
    destination.update_attributes!(balance: destination.balance + Money.new(amount*100, destination.balance.currency))
  end

  def withdrawal
    account.update_attributes!(balance: account.balance - Money.new(amount*100, account.balance.currency))
  end
  
  def create_add_fund_invoice
    destination.invoices.create(amount_cents: amount*100, amount_currency: account.balance.currency.iso_code, note: "Перевод со счета #{account.title} #{note}",
        invtype: Invoice.invtypes[:add_fund])
  end
  
  def create_withdrawal_invoice
	  consumption_type_id = ConsumptionType.where(title: "Перевод").first
    invoice = account.invoices.create(amount_cents: amount*100, amount_currency: account.balance.currency.iso_code,
                            note: "Перевод на счет #{destination.title} #{note}",
                            invtype: Invoice.invtypes[:withdrawal],
                            consumption_type_id: consumption_type_id)

		invoice.consumption_types << consumption_type_id
  end
  
end