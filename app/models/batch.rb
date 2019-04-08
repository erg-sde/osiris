class Batch < ApplicationRecord
  belongs_to :variety
  belongs_to :location
  belongs_to :user 
  has_one :container, through: :variety
  has_many :line_item_batches
  has_many :children, class_name: 'Batch', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Batch', optional: true
  def week_planted
    created_at.strftime('%W').to_i
  end

  def dumped_plants
    children.where(stage: '0').sum('quantity')
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

  def next_stage
    case stage
    when "1"
      "3"
    when "3"
      "5"
    when "5"
      "6"
    when "6"
      "7"
    end
  end
end
