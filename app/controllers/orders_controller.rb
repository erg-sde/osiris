class OrdersController < ApplicationController
  before_action :all_customers, only: %i[index new]

  def create
    op = order_params
    op[:customer] = Customer.find(order_params[:customer])
    op[:billing_customer] = Customer.find(order_params[:billing_customer])
    @order = Order.new(op)
    if @order.save
      flash[:success] = 'Order Saved'
      redirect_to @order
    end
  end

  def show
    order = Order.find(params[:id])
    @order = OrderPresenter.new(order)
  end

  def index
    @orders = Order.all
    @orders = @orders.where(customer: params[:customer_id]) unless params[:customer_id].to_i.zero?
    @orders = @orders.select(&:shipped?) if params[:commit] == 'Filter' && !params[:open].present? 
    @orders = @orders.reject(&:shipped?) unless params[:history].present?
  end

  def new
    @order = Order.new
  end

  private

  def order_params
    params.require(:order).permit(:po_number, :customer, :billing_customer)
  end

  def all_customers
    @customers = Customer.all
  end
end
