class Account::AddFund < ActiveType::Object
  attribute :account_id, :integer
  attribute :amount, :string
  attribute :note, :string

  # monetize :amount
    
  belongs_to :account, class_name: 'Account'

  validate :price_in_a_range_cents
  validates_presence_of :account_id, :amount, :note
    
  after_save :add_fund
  after_save :create_invoice
    
    
  private
    
  def price_in_a_range_cents
    if amount.to_f <= 0.0
      errors.add(:amount, "должно быть больше 0!")
      return false
    end
    return true
  end
    
  def add_fund
    account.update_attributes!(balance: account.balance + Money.new(amount*100, account.balance.currency))
  end
    
  def create_invoice
    account.invoices.create( amount_cents: amount*100, amount_currency: account.balance.currency.iso_code, note: note).add_fund!
  end

end
