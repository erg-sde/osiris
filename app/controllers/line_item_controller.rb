class LineItemController < ApplicationController
  def show
    @line_item = LineItem.find(params[:id])
  end
end
