class AccountAddFund < ActiveType::Object
  attribute :account_id, :integer
  attribute :amount, :string
  attribute :note, :string

  # monetize :amount
    
  belongs_to :account, class_name: 'Account'

  validate :price_in_a_range_cents
  validates_presence_of :account_id, :amount
    
  after_save :add_fund
  after_save :create_invoice
    
    
  private
    
  def price_in_a_range_cents
    if amount.to_f <= 0.0
      errors.add(:amount, "Amount must be greater than 0")
      return false
    end
    return true
  end
    
  def add_fund
    account.update_attributes!(balance: account.balance + amount.to_money)
  end
    
  def create_invoice
    account.invoices.create( amount: amount, note: note, withdrawal?: false )
  end

end
