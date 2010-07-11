class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end
  
  def show
    @candidate = Candidate.find(params[:id])
  end
  
  def new
    @candidate = Candidate.new
  end
  
  def create
    @candidate = Candidate.new(params[:candidate])
    if @candidate.save
      flash[:notice] = "Successfully created candidate."
      redirect_to @candidate
    else
      render :action => 'new'
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id])
  end
  
  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update_attributes(params[:candidate])
      flash[:notice] = "Successfully updated candidate."
      redirect_to @candidate
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    flash[:notice] = "Successfully destroyed candidate."
    redirect_to candidates_url
  end
end
