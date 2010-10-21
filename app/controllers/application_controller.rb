# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :meta_defaults

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == AppConfig.admin_user && password == AppConfig.admin_password
    end
  end
  def authenticate_press
    authenticate_or_request_with_http_basic do |username, password|
      username == AppConfig.press_user && password == AppConfig.press_password
    end
  end
  def meta_defaults
    @meta_keywords = "Winnipeg election, Winnipeg, municipal election, civic election, city council, school trustee, councillor, mayoral, school division, politics, government, democracy, 2010, Manitoba, Canada"
  end
end
