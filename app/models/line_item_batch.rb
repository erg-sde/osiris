class LineItemBatch < ApplicationRecord
  belongs_to :line_item
  belongs_to :batch

  def container_count
    quantity / batch.container.capacity
  end
end
