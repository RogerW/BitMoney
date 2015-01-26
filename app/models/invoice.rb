class Invoice < ActiveRecord::Base
  belongs_to :account
  
  monetize :amount_cents
end
