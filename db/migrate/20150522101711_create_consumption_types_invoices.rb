class CreateConsumptionTypesInvoices < ActiveRecord::Migration
  def change
    create_table :consumption_types_invoices do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :consumption_type, index: true
    end
  end
end
