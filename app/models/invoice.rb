class Invoice < ActiveRecord::Base
  belongs_to :account
  enum type: [:add_fund, :withdrawal]
  
  monetize :amount_cents
end
