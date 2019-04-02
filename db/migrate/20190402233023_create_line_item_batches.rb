class CreateLineItemBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :line_item_batches do |t|
      t.references :line_item, foreign_key: true
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
