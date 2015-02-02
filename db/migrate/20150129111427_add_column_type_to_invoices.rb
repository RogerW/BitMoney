class AddColumnTypeToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :type, :integer
  end
end
