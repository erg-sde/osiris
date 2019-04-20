class OrdersController < ApplicationController
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
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.where(nil)
    @orders = @orders.where(customer: params[:customer_id]) unless params[:customer_id].to_i.zero?
    @orders = @orders.reject{|o| !o.shipped?} if params[:commit] == 'Filter' && !params[:open].present? 
    @orders = @orders.reject(&:shipped?) unless params[:history].present?
    @customers = Customer.all
  end

  def new
    @order = Order.new
    @customers = Customer.all
  end

  private
  def order_params
    params.require(:order).permit(:po_number, :customer, :billing_customer)
  end
end
