class Account < ActiveRecord::Base
  belongs_to :user
  has_many :invoices

  monetize :balance_cents
end
