class ConsumptionType < ActiveRecord::Base
  belongs_to :user
  has_many :consumptions
end
