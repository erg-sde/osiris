class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def create
    @location = Location.create(location_params)
    redirect_to @location if @location.save!
  end
  
  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.require(:location).permit(:name, :capacity)
  end
end
