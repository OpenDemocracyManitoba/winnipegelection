class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def api_authenticate
    authenticate_or_request_with_http_token do |token, options|
      token == Rails.application.secrets.json_api_token
    end
  end

  def active_election
    @active_election ||= Election.active_election
  end
  helper_method :active_election

  def active_council_races_order_by_region_name
    @active_council_races ||= Election.active_council_races_order_by_region_name
  end
  helper_method :active_council_races_order_by_region_name

  def active_school_trustee_races_order_by_region_name
    @active_school_trustee_races ||=
      Election.active_school_trustee_races_order_by_region_name
  end
  helper_method :active_school_trustee_races_order_by_region_name

  def cms_pages
    @cms_pages ||= Page.cms_pages
  end
  helper_method :cms_pages

  def nav_headings
    @nav_headings ||= NavigationHeading.parent_navigation_headings
  end
  helper_method :nav_headings
end
