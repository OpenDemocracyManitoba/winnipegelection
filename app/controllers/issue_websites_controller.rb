class IssueWebsitesController < ApplicationController
  def index
    @issue_websites = active_election.issue_websites.alphabetical
  end
end
