class Batch < ApplicationRecord
  belongs_to :variety
  belongs_to :container
  belongs_to :location
  belongs_to :user
  def week_planted
    created_at.strftime('%U').to_i
  end

  def plant_quantity
    quantity * container.capacity
  end
end
