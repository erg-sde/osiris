class BatchController < ApplicationController
  def index
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def create
  end

  def new
  end
end
