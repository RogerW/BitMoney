class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.boolean :is_default
      t.string :description
      t.money :balance, amount: { null: false, default: 0 }

      t.timestamps
    end
  end
end
