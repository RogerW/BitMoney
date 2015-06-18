class AddConsumptionIconColumnsToConsumptionTypes < ActiveRecord::Migration
  def change
    add_column :consumption_types, :icon, :string
  end
end
