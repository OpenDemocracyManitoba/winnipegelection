class TrusteeCandidatesController < ApplicationController
  before_filter :authenticate
  
  def question
    @trustee_candidates = TrusteeCandidate.all
    @trustees_with_replies = TrusteeCandidate.all(:conditions => 'qa IS NOT NULL and qa != ""').size
  end
  
  def answer
    @trustee_candidate = TrusteeCandidate.find(params[:id])
  end
  
  def index
    @trustee_candidates = TrusteeCandidate.all
  end
  
  def show
    @trustee_candidate = TrusteeCandidate.find(params[:id])
  end
  
  def new
    @trustee_candidate = TrusteeCandidate.new
    @school_wards = SchoolWard.all
  end
  
  def create
    @trustee_candidate = TrusteeCandidate.new(params[:trustee_candidate])
    if @trustee_candidate.save
      flash[:notice] = "Successfully created trustee candidate."
      redirect_to @trustee_candidate
    else
      render :action => 'new'
    end
  end
  
  def edit
    @trustee_candidate = TrusteeCandidate.find(params[:id])
    @school_wards = SchoolWard.all
  end
  
  def update
    @trustee_candidate = TrusteeCandidate.find(params[:id])
    if @trustee_candidate.update_attributes(params[:trustee_candidate])
      flash[:notice] = "Successfully updated trustee candidate."
      
      redirect_to @trustee_candidate
    else
      render :action => 'edit'
    end
  end
  
  def updateqa
    @trustee_candidate = TrusteeCandidate.find(params[:id])
    if @trustee_candidate.update_attributes(params[:trustee_candidate])
      flash[:notice] = "Successfully updated trustee questionnaire."
    else
      render :action => 'answer'
    end
  end
  
  def destroy
    @trustee_candidate = TrusteeCandidate.find(params[:id])
    @trustee_candidate.destroy
    flash[:notice] = "Successfully destroyed trustee candidate."
    redirect_to trustee_candidates_url
  end
end
