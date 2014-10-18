class IssueWebsitesController < ApplicationController
  caches_page :index

  def index
    @issue_websites = active_election.issue_websites.alphabetical
  end
end
