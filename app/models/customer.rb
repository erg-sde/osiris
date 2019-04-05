class Customer < ApplicationRecord
has_many :orders
    def order_count
        orders.length
    end

    def total_value
        orders.sum(&:value)
    end
end
