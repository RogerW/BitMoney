class Invoice < ActiveRecord::Base
  belongs_to :account
  has_many :consumptions
  has_many :consumption_types, through: :consumptions

  enum invtype: [:add_fund, :withdrawal]
  
  monetize :amount_cents, with_model_currency: :amount_currency
end
