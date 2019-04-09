class AddBatchToBatches < ActiveRecord::Migration[5.2]
  def change
    add_reference :batches, :parent, index: true
  end
end
