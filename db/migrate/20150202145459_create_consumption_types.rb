class CreateConsumptionTypes < ActiveRecord::Migration
  def change
    create_table :consumption_types do |t|
      t.string :title
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
