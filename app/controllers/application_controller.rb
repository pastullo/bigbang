class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :check_optin


  private

  def check_optin
  	return unless user_signed_in?
  	return if current_user.optin
  	return if controller_name == 'users' and (action_name == 'optin' or action_name == 'change_optin')
  	flash[:notice] = 'you have to optin brew'
  	redirect_to optin_path
  end
end
