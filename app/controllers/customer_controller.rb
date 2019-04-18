class CustomerController < ApplicationController
  def index
    @customers = Customer.all.sort_by(&:active_orders_count).reverse
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = 'Customer Saved'
      redirect_to @customer
    end
  end

  def new
    @customer = Customer.new
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :region)
  end
end
