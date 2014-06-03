class CandidatesController < ApplicationController
  def show
    @candidate = Person.find(params[:id])
    render text: @candidate.name
  end

  def redirect_show
    candidate = Person.find_by(name: params[:candidate_name].gsub('_',' '))
    if candidate
      redirect_to candidate_url(id: candidate.id), status: 301
    else
      fail ActiveRecord::RecordNotFound
    end
  end
end
