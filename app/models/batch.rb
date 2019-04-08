class Batch < ApplicationRecord
  belongs_to :variety
  belongs_to :location
  belongs_to :user
  has_many :line_item_batches
  def week_planted
    created_at.strftime('%W').to_i
  end

  def plant_quantity
    quantity * variety.container.capacity
  end

  def value
    quantity * variety.price / 100
  end

  def plants_shipped
    line_item_batches.sum('quantity')
  end

  def plants_available
    plant_quantity - plants_shipped
  end
end
