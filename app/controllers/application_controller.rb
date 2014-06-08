class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def active_election
    @active_election ||= Election.active_election
  end
  helper_method :active_election

  def cms_pages
    @cms_pages ||= Page.cms_pages
  end
  helper_method :cms_pages
end
