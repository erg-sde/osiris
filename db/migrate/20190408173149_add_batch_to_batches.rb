class AddBatchToBatches < ActiveRecord::Migration[5.2]
  def change
    add_reference :batches, :parent, foreign_key: true
  end
end
