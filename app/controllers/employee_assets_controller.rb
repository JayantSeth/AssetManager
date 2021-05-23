class EmployeeAssetsController < ApplicationController
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_employee_asset, only: [:show, :edit, :update, :destroy]
  before_action :set_employees, only: [:new, :edit, :update, :create]
  before_action :set_enterprise_assets, only: [:new, :edit, :update, :create]

  def new 
    @employee_asset = EmployeeAsset.new 
  end

  def create 
    @employee_asset = EmployeeAsset.new(employee_asset_params) 
    if @employee_asset.save
      flash[:notice] = "Employee Asset is successfully created" 
      redirect_to employee_assets_path
    else
      render 'new'
    end
  end

  def index 
    @employee_assets = EmployeeAsset.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @employee_asset.update(employee_asset_params)
      flash[:notice] = "Employee Asset was successfully updated"
      redirect_to @employee_asset  
    else
      render 'edit'
    end
  end

  def destroy 
    @employee_asset.destroy 
    flash[:notice] = "Employee Asset was successfully deleted"
    redirect_to employee_assets_path  
  end

  private 
  def employee_asset_params 
    params.require(:employee_asset).permit(:employee_id, :enterprise_asset_id, :comment)
  end

  def set_employee_asset 
    @employee_asset = EmployeeAsset.find(params[:id])
  end

  def set_employees 
    employees = Employee.all 
    @employees_list = []
    employees.each do |employee|
      @employees_list.append(employee.emp_code)
    @employees_list
    end
  end

  def set_enterprise_assets 
    enterprise_assets = EnterpriseAsset.all 
    @assets_list = []
    enterprise_assets.each do |enterprise_asset| 
      @assets_list.append(enterprise_asset.serial_number)
    @assets_list
    end
  end
end
