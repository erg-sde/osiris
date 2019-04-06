class AddBillingCustomerToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :billing_customer, foreign_key: true
  end
end
