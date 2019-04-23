class LineItem < ApplicationRecord
  belongs_to :variety
  belongs_to :order
  has_many :line_item_batches
  has_many :batches, through: :line_item_batches

   def value
    quantity * variety.price
  end

  def shipped
    line_item_batches.sum('quantity')
  end

  def shipped?
    shipped >= quantity
  end

  def to_ship
    quantity - shipped
  end

  def last_ship_date
    max = line_item_batches.maximum('created_at')
    return max.present? ? max.strftime('%F') : nil
  end
end
