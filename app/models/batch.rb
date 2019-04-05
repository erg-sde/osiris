class Batch < ApplicationRecord
  belongs_to :variety
  belongs_to :location
  belongs_to :user
  has_many :line_item_batches
  def week_planted
    created_at.strftime('%U').to_i
  end

  def plant_quantity
    quantity * variety.container.capacity
  end

  def value
    quantity * variety.price / 100
  end
end
