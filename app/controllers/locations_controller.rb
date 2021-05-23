class LocationsController < ApplicationController
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_location_types, only: [:new, :edit, :update, :create]

  def new 
    @location = Location.new 
  end

  def create 
    @location = Location.new(location_params) 
    if @location.save
      flash[:notice] = "Location #{@location.location} is successfully created" 
      redirect_to locations_path
    else
      render 'new'
    end
  end

  def index 
    @locations = Location.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @location.update(location_params)
      flash[:notice] = "Location #{@location.location} was successfully updated"
      redirect_to @location  
    else
      render 'edit'
    end
  end

  def destroy 
    @location.destroy 
    flash[:notice] = "Location #{@location.location} was successfully deleted"
    redirect_to locations_path  
  end

  private 
  def location_params 
    params.require(:location).permit(:location, :location_type_id, :comment)
  end

  def set_location 
    @location = Location.find(params[:id])
  end

  def set_location_types 
    location_types = LocationType.all 
    @location_types_list = []
    location_types.each do |location_type|
      @location_types_list.append(location_type.location_type)
    @location_types_list
    end
  end
end
