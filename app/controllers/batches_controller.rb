class BatchesController < ApplicationController
  def index
    
    @batches = Batch.where(nil).primary
    start_date = Date.commercial(2019, params[:start_week].to_i, 1) if (params[:start_week].present? && params[:start_week] != '--')
    end_date = Date.commercial(2019, params[:end_week].to_i, 7) if (params[:end_week].present? && params[:start_week] != '--')
    @batches = @batches.where(planted_week: (start_date || Date.today - 90)..(end_date || Time.now)) if params[:start_week].present? || params[:end_week].present?
    @batches = @batches.reject { |batch| batch.plants_available.positive? } if  params[:commit] == 'Filter' && !params[:open].present? 
    @batches = @batches.reject { |batch| batch.plants_available <= 0 } unless params[:history].present?
    @batches = @batches.select { |batch| batch.stage = params[:stage] } if params[:stage].to_i.positive?
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
