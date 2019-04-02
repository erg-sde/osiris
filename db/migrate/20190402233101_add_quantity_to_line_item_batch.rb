class AddQuantityToLineItemBatch < ActiveRecord::Migration[5.2]
  def change
    add_column :line_item_batches, :quantity, :integer
  end
end
