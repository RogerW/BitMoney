class AccountTransfer < ActiveType::Object
  attribute :account_id, :integer
  attribute :destination_id, :integer
  attribute :amount, :string
  attribute :note, :string

  # monetize :amount
    
  belongs_to :account, class_name: 'Account'
  belongs_to :destination, class_name: 'Account'
  
  # validate :has_money?
  validates_presence_of :account_id, :destination_id, :amount
  
  after_save :add_fund
  after_save :withdrawal
  after_save :create_add_fund_invoice
  after_save :create_withdrawal_invoice
  
  private
  
  def has_money?
    if source_account.balance < amount.to_money
      errors.add(:amount, "Not enough money")
    end
  end
  
  def add_fund 
    destination.attribute_update!(balance: destination.balance + amount.to_money)
  end
  
  def withdrawal
    account.attribute_update!(balance: account.balance - amount.to_money)
  end
  
  def create_add_fund_invoice
    destination.invoices.create(amount: amount, note: "Transfer from account id #{account.id} #{note}")
  end
  
  def create_withdrawal_invoice
    account.invoices.create(amount: amount*-1, note: "Transfer to account id #{destination.id} #{note}")
  end
  
  def source_account
    Account.find(:account_id)
  end
  
end