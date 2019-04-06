class BatchController < ApplicationController
  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
    @batch = Batch.new
    @varieties = Variety.all
    @locations = Location.all
    @users = User.all
  end

  def create
    bp = batch_params
    bp[:variety] = Variety.find(batch_params[:variety])
    bp[:location] = Location.find(batch_params[:location])
    bp[:user] = User.find(batch_params[:user])
    @batch = Batch.new(bp)
    @batch.stage = "1"
    if @batch.save
      flash[:success] = "Batch Saved"
      redirect_to @batch
    end
  end

  private
  def batch_params
    params.require(:batch).permit(:user, :variety, :location, :quantity, :treatment, :soil)
  end
end
