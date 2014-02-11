class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :check_optin


  private
  def check_admin
    return if current_user.admin?
    flash[:alert] = 'You do not have rights to access this page'
    redirect_to root_path
  end
  def check_optin
  	return unless user_signed_in?
  	return if current_user.optin
  	return if (controller_name == 'users' and (action_name == 'optin' or action_name == 'change_optin')) or (action_name == 'destroy' and controller_name == 'sessions')
  	# flash[:notice] = 'You have to optin first'
  	redirect_to optin_path
  end
  def check_owner
    return if current_user.admin? 
    return if params[:id].to_i == current_user.id  
    flash[:alert] = 'You have to be logged to access this page'
    redirect_to root_path 
  end
end
