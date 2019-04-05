class LineItem < ApplicationRecord
  belongs_to :variety
  belongs_to :order
  has_many :line_item_batches
  has_many :batches, through: :line_item_batches
  def value
    quantity * variety.price
  end
end
