class DeleteWithdrawalColumnFromInvoives < ActiveRecord::Migration
  def change
    remove_column :invoices, :withdrawal?
  end
end
