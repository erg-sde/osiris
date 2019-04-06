class Order < ApplicationRecord
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
  belongs_to :billing_customer, class_name: 'Customer', foreign_key: 'billing_customer_id'
  has_many :line_items
  
  validates :po_number, presence: true
  
  def value
    line_items.sum(&:value)
  end

  def ready_to_ship?
    line_items.collect(&:ready_to_ship?).all?
  end

end
