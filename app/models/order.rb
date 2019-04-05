class Order < ApplicationRecord
  belongs_to :customer
  has_many :line_items

  def value
    line_items.sum(&:value)
  end

  def ready_to_ship?
    line_items.collect(&:ready_to_ship?).all?
  end
end
