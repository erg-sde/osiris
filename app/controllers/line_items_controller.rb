class LineItemsController < ApplicationController
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
      flash[:success] = 'Line Item Saved'
      redirect_to @line_item
    else
      redirect_to '/order'
      flash[:warning] = 'Creation Failed'
    end
  end

  def index
    @line_items = LineItem.where(nil)
    @line_items = @line_items.select{ |batch| !batch.shipped? }
  end

  def edit
    @line_item = LineItem.find(params[:id])
    @batches = Batch.where(stage: '5', variety: @line_item.variety)
  end

  def update
    @line_item = LineItem.find(params[:id])
    @batch_list = params[:batches].zip( params[:quantities])
    @batch_list.each do |batch_data|
      next unless batch_data[1].to_i.positive?

      LineItemBatch.create(line_item: @line_item,
                           batch: Batch.find(batch_data[0]),
                           quantity: batch_data[1])
    end
    redirect_to @line_item
  end

  private

  def li_params
    params.fetch(:line_item, {}).permit(:id, :order, :po_number,
                                        :variety, :ship_week, :quantity)
  end
end
