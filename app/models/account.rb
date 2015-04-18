class Account < ActiveRecord::Base
  belongs_to :user
  has_many :invoices
  has_many :consumptions, through: :invoices

  monetize :balance_cents
end
