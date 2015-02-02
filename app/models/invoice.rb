class Invoice < ActiveRecord::Base
  belongs_to :account
  has_many :consumptions

  enum type: [:add_fund, :withdrawal]
  
  monetize :amount_cents
end
