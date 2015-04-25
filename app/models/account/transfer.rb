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
  validates_presence_of :account_id, :destination_id, :amount
  
  after_save :add_fund
  after_save :withdrawal
  after_save :create_add_fund_invoice
  after_save :create_withdrawal_invoice

  private
  
  def has_money?
    if account.balance < amount.to_money
      errors.add(:amount, "Not enough money")
    end
  end

  def equal_accounts?
    if account.id == destination.id
      errors.add(:destination_id, "Source and Destination Equal")
    end
  end
  
  def add_fund 
    destination.update_attributes!(balance: destination.balance + amount.to_money)
  end
  
  def withdrawal
    account.update_attributes!(balance: account.balance - amount.to_money)
  end
  
  def create_add_fund_invoice
    destination.invoices.create(amount: amount, note: "Transfer from account id #{account.id} #{note}", 
        invtype: Invoice.invtypes[:add_fund])
  end
  
  def create_withdrawal_invoice
    invoice = account.invoices.create(amount: amount, 
        note: "Transfer to account id #{destination.id} #{note}", 
        invtype: Invoice.invtypes[:withdrawal])
    consumption_type_id = ConsumptionType.where(title: "Перевод").first
    invoice.consumptions.create(consumption_type_id: consumption_type_id)
  end
  
end