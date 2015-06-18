class DropConsumptionsTable < ActiveRecord::Migration
  def change
    drop_table :consumptions
  end
end
