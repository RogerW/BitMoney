class DeleteTypeAndAddInvTypeColumnToInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :type, :integer
    add_column :invoices, :invtype, :integer
  end
end
