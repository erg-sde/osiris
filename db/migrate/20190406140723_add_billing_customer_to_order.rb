class AddBillingCustomerToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :billing_customer, index: true
  end
end
