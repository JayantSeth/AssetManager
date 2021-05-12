class DepartmentsController < ApplicationController
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def new 
    @department = Department.new 
  end

  def create 
    @department = Department.new(department_params) 
    if @department.save
      flash[:notice] = "Department #{@department.department} is successfully created" 
      redirect_to departments_path
    else
      render 'new'
    end
  end

  def index 
    @departments = Department.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @department.update(department_params)
      flash[:notice] = "Department #{@department.department} was successfully updated"
      redirect_to @department  
    else
      render 'edit'
    end
  end

  def destroy 
    @department.destroy 
    flash[:notice] = "Department #{@department.department} was successfully deleted"
    redirect_to departments_path  
  end

  private 
  def department_params 
    params.require(:department).permit(:department, :comment)
  end

  def set_department 
    @department = Department.find(params[:id])
  end
end
