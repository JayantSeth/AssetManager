class EmployeesController < ApplicationController
  before_action :require_user 
  before_action :authorized_user, except: [:index, :show]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new, :edit, :update, :create]
  before_action :set_locations, only: [:new, :edit, :update, :create]

  def new 
    @employee = Employee.new 
  end

  def create 
    @employee = Employee.new(employee_params) 
    if @employee.save
      flash[:notice] = "Employee #{@employee.emp_name} is successfully created" 
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def index 
    @employees = Employee.all 
  end

  def show 
  end

  def edit
  end

  def update 
    if @employee.update(employee_params)
      flash[:notice] = "Employee #{@employee.emp_name} was successfully updated"
      redirect_to @employee  
    else
      render 'edit'
    end
  end

  def destroy 
    @employee.destroy 
    flash[:notice] = "Employee #{@employee.emp_name} was successfully deleted"
    redirect_to employees_path  
  end

  private 
  def employee_params 
    new_params = {}
    tmp_params = params.require(:employee).permit(:emp_name, 
    :emp_code, :designation, :contact, :email, :emp_joining_date, 
    :department, :location)
    department_id = Department.find_by(department: tmp_params[:department])[:id]
    location_id = Location.find_by(location: tmp_params[:location])[:id]
    {emp_name: tmp_params[:emp_name], emp_code: tmp_params[:emp_code], 
    designation: tmp_params[:designation], contact: tmp_params[:contact], 
    email: tmp_params[:email], emp_joining_date: tmp_params[:emp_joining_date], 
    department_id: department_id, location_id: location_id}
  end

  def set_employee 
    @employee = Employee.find(params[:id])
  end

  def set_departments 
    departments = Department.all 
    @departments_list = []
    departments.each do |department|
      @departments_list.append(department.department)
    @departments_list
    end
  end

  def set_locations 
    locations = Location.all 
    @locations_list = []
    locations.each do |location| 
      @locations_list.append(location.location) 
    @locations_list 
    end 
  end
end
