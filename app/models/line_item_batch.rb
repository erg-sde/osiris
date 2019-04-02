class LineItemBatch < ApplicationRecord
  belongs_to :line_item
  belongs_to :batch
end
