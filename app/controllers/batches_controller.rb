class BatchesController < ApplicationController
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

  def edit
    @batch = Batch.find(params[:id])
  end

  def update
    @batch = Batch.find(params[:id])
    if params[:dump]
      @dump = Batch.new(parent: @batch, 
                        variety: @batch.variety,
                        quantity:params[:dump],
                        location: @batch.location,
                        user: @batch.user,
                        stage: '0')
      if @dump.save
      end
    end
    @batch.save
    redirect_to @batch
  end

  private
  def batch_params
    params.require(:batch).permit(:user, :variety, :location, :quantity, :treatment, :soil, :dump)
  end
end
