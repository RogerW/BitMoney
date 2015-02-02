class CreateConsumptions < ActiveRecord::Migration
  def change
    create_table :consumptions do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :consumption_type, index: true

      t.timestamps
    end
  end
end
