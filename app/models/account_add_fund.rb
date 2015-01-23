class AccountAddFund < ActiveType::Object
    attribute :account_id, :integer
    attribute :amount, :money
    attribute :note, :string
    
    belongs_to :account, class_name: 'Account'

    validate :price_in_a_range_cents
    validates_presence_of :id, :amount
    
    after_save :add_funds
    after_save :create_invoice
    
    
    private
    
    def price_in_a_range_cents
        if amount <= 0
            errors.add(:amount, "Amount must be greater than 0")
        end
    end
    
    def create_add_fund
        account.update_attributes!(amount: account.amount + amount)
    end
    
    def create_invoice
        account.invoices.create( amount: amount, note: note )
    end
    
end
