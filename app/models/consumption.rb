class Consumption < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :consumption_type
end
