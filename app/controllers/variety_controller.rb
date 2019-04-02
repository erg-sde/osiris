class VarietyController < ApplicationController
  def index
    @varieties = Variety.all
  end

  def show
    @variety = Variety.find(params[:id])
  end

  private
  def variety_params
    params.require(:variety).permit(:name, :age)
  end
end
