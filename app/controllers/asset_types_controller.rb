class AssetTypesController < ApplicationController 
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_asset_type, only: [:show, :edit, :update, :destroy]

  def new 
    @asset_type = AssetType.new 
  end

  def create 
    @asset_type = AssetType.new(asset_type_params) 
    if @asset_type.save
      flash[:notice] = "Asset Type #{@asset_type.asset_type} is successfully created" 
      redirect_to asset_types_path
    else
      render 'new'
    end
  end

  def index 
    @asset_types = AssetType.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @asset_type.update(asset_type_params)
      flash[:notice] = "Asset Type #{@asset_type.asset_type} was successfully updated"
      redirect_to @asset_type  
    else
      render 'edit'
    end
  end

  def destroy 
    @asset_type.destroy 
    flash[:notice] = "Asset Type #{@asset_type.asset_type} was successfully deleted"
    redirect_to asset_types_path  
  end

  private 
  def asset_type_params 
    params.require(:asset_type).permit(:asset_type, :comment)
  end

  def set_asset_type 
    @asset_type = AssetType.find(params[:id])
  end
end
