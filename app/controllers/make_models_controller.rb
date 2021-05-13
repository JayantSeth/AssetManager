class MakeModelsController < ApplicationController
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_make_model, only: [:show, :edit, :update, :destroy]
  before_action :set_asset_types, only: [:new, :edit, :update, :create]

  def new 
    @make_model = MakeModel.new 
  end

  def create 
    @make_model = MakeModel.new(make_model_params) 
    if @make_model.save
      flash[:notice] = "Model #{@make_model.model} is successfully created" 
      redirect_to make_models_path
    else
      render 'new'
    end
  end

  def index 
    @make_models = MakeModel.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @make_model.update(make_model_params)
      flash[:notice] = "Model #{@make_model.model} was successfully updated"
      redirect_to @make_model  
    else
      render 'edit'
    end
  end

  def destroy 
    @make_model.destroy 
    flash[:notice] = "Model #{@make_model.model} was successfully deleted"
    redirect_to make_models_path  
  end

  private 
  def make_model_params 
    new_params = {}
    tmp_params = params.require(:make_model).permit(:make, :model, :asset_type, :comment)
    asset_type_id = AssetType.find_by(asset_type: tmp_params[:asset_type])[:id]
    {make: tmp_params[:make], model: tmp_params[:model], 
    asset_type_id: asset_type_id, comment: tmp_params[:comment]}
  end

  def set_make_model 
    @make_model = MakeModel.find(params[:id])
  end

  def set_asset_types 
    asset_types = AssetType.all 
    @asset_types_list = []
    asset_types.each do |asset_type|
      @asset_types_list.append(asset_type.asset_type)
    @asset_types_list
    end
  end
end
