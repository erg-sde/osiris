class Order < ApplicationRecord
  belongs_to :customer
  has_many :line_items

  def value
    line_items.sum(&:value)
  end
end
