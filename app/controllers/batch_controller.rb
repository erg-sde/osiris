class BatchController < ApplicationController
  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def create
  end

  def new
  end
end
