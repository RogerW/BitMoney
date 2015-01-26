class AddWithdrawalColumnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :withdrawal?, :boolean, default: false
  end
end
