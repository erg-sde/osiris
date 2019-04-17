class BatchesController < ApplicationController
  def index
    @batches = Batch.where(nil).primary
    @batches = @batches.stage(params[:stage]) if params[:stage].present?
    @batches = @batches.select { |batch| batch.plants_available.positive? }
    @stages = %w[1 3 5 6 7]
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
    @batch.stage = '1'
    if @batch.save
      flash[:success] = 'Batch Saved'
      redirect_to @batch
    end
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def update
    @batch = Batch.find(params[:id])
    @batch.dump(params[:dump]) if params[:dump].to_i.positive?
    @batch.cull(params[:cull]) if params[:cull].to_i.positive?
    @batch.stage = params[:batch][:stage]
    @batch.save
    redirect_to @batch
  end

  private

  def batch_params
    params.require(:batch).permit(:user, :variety, :location, :quantity,
                                  :treatment, :soil, :dump)
  end
end
