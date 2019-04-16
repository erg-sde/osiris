class VarietiesController < ApplicationController
  def index
    @varieties = Variety.all
  end

  def show
    @variety = Variety.find(params[:id])
  end

  def new
    @variety = Variety.new
    @containers = Container.all
  end

  def create
    vp = variety_params
    vp[:container] = Container.find(vp[:container])
    @variety = Variety.new(vp)
    if @variety.save
      redirect_to @variety
    end
  end
  private
  def variety_params
    params.require(:variety).permit(:name, :container, :price, :root_time, :reorder_amount)
  end
end
