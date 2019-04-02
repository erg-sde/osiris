class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :po_number
      t.string :region
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
