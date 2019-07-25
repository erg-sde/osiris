class OrderPresenter < SimpleDelegator

  def customer_name
    customer.name
  end

  def created_at
    created_at.strftime("%F")
  end
end
