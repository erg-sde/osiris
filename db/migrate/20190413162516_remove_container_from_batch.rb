class RemoveContainerFromBatch < ActiveRecord::Migration[5.2]
  def change
    remove_reference :batches, :container, foreign_key: true
  end
end
