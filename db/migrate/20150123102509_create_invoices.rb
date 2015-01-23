class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :account, index: true
      t.money :amount
      t.string :note

      t.timestamps
    end
  end
end
