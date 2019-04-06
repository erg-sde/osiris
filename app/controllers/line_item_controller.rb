class LineItemController < ApplicationController
  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
    @varieties = Variety.all
    @order = Order.find(params[:order])
  end

  def create
    lp = li_params
    lp[:variety] = Variety.find(li_params[:variety])
    lp[:order] = Order.find(li_params[:order])
    @line_item = LineItem.new(lp)
    if @line_item.save
      flash[:success] = "Line Item Saved"
      redirect_to @line_item
    else
      redirect_to '/order'
      flash[:warning] = "Creation Failed"
    end
  end

  private
  def li_params
    params.require(:line_item).permit(:order, :po_number, :variety, :ship_week, :quantity)
  end
end
