class CandidatesController < ApplicationController
  before_filter :authenticate
  
  def index
    @candidates = Candidate.all(:include => :ward)
  end
  
  def show
    @candidate = Candidate.find(params[:id])
  end
  
  def new
    @candidate = Candidate.new
    @wards = Ward.all
  end
  
  def create
    @candidate = Candidate.new(params[:candidate])
    if @candidate.save
      flash[:notice] = "Successfully created candidate."
      redirect_to :candidates
    else
      render :action => 'new'
    end
  end
  
  def edit
    @candidate = Candidate.find(params[:id])
    @wards = Ward.all
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
