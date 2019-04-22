class LineItem < ApplicationRecord
  belongs_to :variety
  belongs_to :order
  has_many :line_item_batches
  has_many :batches, through: :line_item_batches


  def value
    quantity * variety.price
  end

  def allocated
    line_item_batches.sum('quantity')
  end

  def shipped?
    allocated >= quantity
  end

  def to_ship
    quantity - allocated
  end

  def last_ship_date
    line_item_batches.maximum('created_at')
  end
end
