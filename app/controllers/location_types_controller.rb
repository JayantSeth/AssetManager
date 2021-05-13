class LocationTypesController < ApplicationController 
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_location_type, only: [:show, :edit, :update, :destroy]

  def new 
    @location_type = LocationType.new 
  end

  def create 
    @location_type = LocationType.new(location_type_params) 
    if @location_type.save
      flash[:notice] = "Location Type #{@location_type.location_type} is successfully created" 
      redirect_to location_types_path
    else
      render 'new'
    end
  end

  def index 
    @location_types = LocationType.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @location_type.update(location_type_params)
      flash[:notice] = "Location Type #{@location_type.location_type} was successfully updated"
      redirect_to @location_type  
    else
      render 'edit'
    end
  end

  def destroy 
    @location_type.destroy 
    flash[:notice] = "Location Type #{@location_type.location_type} was successfully deleted"
    redirect_to location_types_path  
  end

  private 
  def location_type_params 
    params.require(:location_type).permit(:location_type, :comment)
  end

  def set_location_type 
    @location_type = LocationType.find(params[:id])
  end
end
