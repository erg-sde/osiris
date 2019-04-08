class Variety < ApplicationRecord
  belongs_to :container
  has_many :batches
  has_many :line_items
  def total_containers
    batches.sum('quantity')
  end

  def ready_to_ship
    batches.where(stage: '5').sum(&:plants_available) * container.capacity
  end

  def total_plants
    total_containers * container.capacity
  end

  def batch_count
    batches.length
  end

  def total_ordered
    line_items.sum('quantity')
  end

  def total_available
    ready_to_ship - total_ordered
  end

  def available?
    total_available > 0
  end

  def parent_batches
    batches.select{|batch| batch.type == 'parent'}
  end
end
