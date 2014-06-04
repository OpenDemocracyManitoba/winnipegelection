class HomeController < ApplicationController
  def index
    @active_election = Election.active_election
  end
end
