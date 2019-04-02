class Variety < ApplicationRecord
  belongs_to :container
  has_many :batches

  def total_containers
    batches.sum('quantity')
  end

  def total_plants
    total_containers * container.capacity
  end
end
