class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :variety, foreign_key: true
      t.integer :quantity
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
