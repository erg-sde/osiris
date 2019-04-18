class Customer < ApplicationRecord
  has_many :orders, class_name: 'Order', foreign_key: 'customer_id'
  has_many :billing_orders,
           class_name: 'Order',
           foreign_key: 'billing_customer_id'

  def active_orders
    orders.reject(&:shipped?)
  end

  def active_orders_count
    active_orders.length
  end

  def total_value
    orders.sum(&:value)
  end

  def open_value
    orders.reject(&:shipped?).sum(&:value)
  end
end
