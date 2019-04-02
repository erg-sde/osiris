class Location < ApplicationRecord
  has_many :batches

  def allocated_capacity
    batches.sum('quantity')
  end

  def remaining_capacity
    capacity - allocated_capacity
  end
end
