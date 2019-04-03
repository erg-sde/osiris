class Location < ApplicationRecord
  has_many :batches

  def self.total_capacity
    Location.all.sum('capacity')
  end

  def self.total_allocated_capacity
    Location.all.sum(&:allocated_capacity)
  end

  def self.total_available_capacity
    Location.total_capacity - Location.total_allocated_capacity
  end

  def allocated_capacity
    batches.sum('quantity')
  end

  def remaining_capacity
    capacity - allocated_capacity
  end

  def batch_count
    batches.length
  end
end
