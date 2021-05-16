class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :is_authorized?, :all_asset_types, :all_location_types, :all_make_models, :get_asset_status_list
  helper_method :all_locations, :all_departments
  
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def all_asset_types 
    @asset_types ||= AssetType.all 
  end

  def all_location_types 
    @location_types ||= LocationType.all 
  end

  def all_make_models
    @make_models ||= MakeModel.all 
  end

  def all_departments 
    @departments ||= Department.all 
  end

  def all_locations 
    @locations ||= Location.all 
  end

  def logged_in?
    !!current_user
  end

  def require_user 
    if !logged_in? 
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path 
    end
  end

  def authorized_user 
    if !current_user.approved?
      flash[:alert] = "You are not authorized to perform this action, please ask admin to approve your profile."
      redirect_to users_path 
    end
  end

  def is_authorized?
    current_user.approved? 
  end

  def get_asset_status_list 
    @asset_status_list ||= ['In_Use', 'In_Stock', 'Scrap', 'Under_Repair'] 
  end
end
