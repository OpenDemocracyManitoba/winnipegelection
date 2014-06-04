class HomeController < ApplicationController
  def index
    @active_election = Election.active_election
    @days_until_election = @active_election.election_date - Date.today
  end
end
