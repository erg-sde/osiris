class LineItemBatch < ApplicationRecord
  belongs_to :line_item
  belongs_to :batch

  def container_count
    quantity.nil? ? 0 : quantity / batch.container.capacity
  end
end
