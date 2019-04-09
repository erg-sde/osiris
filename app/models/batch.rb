class Batch < ApplicationRecord
  belongs_to :variety
  belongs_to :location
  belongs_to :user 
  belongs_to :parent, class_name: 'Batch', optional: true
  has_one :container, through: :variety
  has_many :line_item_batches
  has_many :children, class_name: 'Batch', foreign_key: 'parent_id'
  
  scope :primary, -> { where.not(stage: '0') }
 
  def week_planted
    created_at.strftime('%W').to_i
  end

  def dumped_plants
    children.where(stage: '0').sum('quantity') * variety.container.capacity
  end

  def culled_plants
    children.where.not(stage: '0').sum('quantity') * variety.container.capacity
  end

  def type
    stage == '0' ? 'dump' : !parent.nil? ? 'cull' : 'parent'
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
    plant_quantity - plants_shipped - dumped_plants - culled_plants
  end

  def plants_available?
    plants_available > 0
  end

  def next_stage
    stages = ["1", "3", "5", "6", "7"]
    stages[stages.index(stage) + 1]
  end
end
