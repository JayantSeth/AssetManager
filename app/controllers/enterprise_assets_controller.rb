class EnterpriseAssetsController < ApplicationController
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_enterprise_asset, only: [:show, :edit, :update, :destroy]
  before_action :set_make_model, only: [:new, :edit, :update, :create]

  def new 
    @enterprise_asset = EnterpriseAsset.new 
  end

  def create 
    @enterprise_asset = EnterpriseAsset.new(enterprise_asset_params) 
    if @enterprise_asset.save
      flash[:notice] = "Asset #{@enterprise_asset.hostname} is successfully created" 
      redirect_to enterprise_assets_path
    else
      render 'new'
    end
  end

  def index 
    @enterprise_assets = EnterpriseAsset.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @enterprise_asset.update(enterprise_asset_params)
      flash[:notice] = "Asset #{@enterprise_asset.hostname} was successfully updated"
      redirect_to @enterprise_asset  
    else
      render 'edit'
    end
  end

  def destroy 
    @enterprise_asset.destroy 
    flash[:notice] = "Asset #{@enterprise_asset.hostname} was successfully deleted"
    redirect_to enterprise_assets_path  
  end

  private 

  def convert_to_date(date_as_string)
    #expecting date format in "yyyy-mm-dd" format
    if date_as_string.length > 0
      split_date = date_as_string.split('-')
      return Date.new(year=split_date[0].to_i, month=split_date[1].to_i, 
      day=split_date[2].to_i) 
    else
      return nil 
    end 
  end 

  def enterprise_asset_params 
    new_params = {}
    tmp_params = params.require(:enterprise_asset).permit(:hostname, :serial_number, 
    :model, :warranty_start_date, :warranty_end_date, 
    :is_instrument_machine, :asset_status, :comment)
    make_model_id = MakeModel.find_by(model: tmp_params[:model])[:id]
    {hostname: tmp_params[:hostname], serial_number: tmp_params[:serial_number], 
    make_model_id: make_model_id,
    warranty_start_date: convert_to_date(tmp_params[:warranty_start_date]), 
    warranty_end_date: convert_to_date(tmp_params[:warranty_end_date]), 
    is_instrument_machine: tmp_params[:is_instrument_machine], 
    asset_status: tmp_params[:asset_status], comment: tmp_params[:comment]}
  end

  def set_enterprise_asset 
    @enterprise_asset = EnterpriseAsset.find(params[:id])
  end

  def set_make_model
    make_models = MakeModel.all 
    @make_models_list = []
    make_models.each do |make_model|
      @make_models_list.append(make_model.model)
    @make_models_list
    end
  end
end
