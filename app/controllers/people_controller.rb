class PeopleController < ApplicationController
  caches_page :show

  def show
    @person = Person.friendly_find(params)
    @most_recent_candidacy = @person.most_recent_candidacy
    @most_recent_election = @person.most_recent_election
    @is_running_in_active_election = active_election == @most_recent_election
    @news_mentions = @person.approved_news_mentions.page(params[:page])
  end

  def redirect_show
    person = Person.find_by(name: params[:name_slug].gsub('_', ' '))
    if person
      redirect_to person.friendly_path, status: 301
    else
      fail ActiveRecord::RecordNotFound
    end
  end
end
