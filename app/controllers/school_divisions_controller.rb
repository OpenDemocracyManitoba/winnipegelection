class SchoolDivisionsController < ApplicationController
  before_filter :authenticate
  def index
    @school_divisions = SchoolDivision.all
  end
  
  def show
    @school_division = SchoolDivision.find(params[:id])
  end
  
  def new
    @school_division = SchoolDivision.new
  end
  
  def create
    @school_division = SchoolDivision.new(params[:school_division])
    if @school_division.save
      flash[:notice] = "Successfully created school division."
      redirect_to @school_division
    else
      render :action => 'new'
    end
  end
  
  def edit
    @school_division = SchoolDivision.find(params[:id])
  end
  
  def update
    @school_division = SchoolDivision.find(params[:id])
    if @school_division.update_attributes(params[:school_division])
      flash[:notice] = "Successfully updated school division."
      redirect_to @school_division
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @school_division = SchoolDivision.find(params[:id])
    @school_division.destroy
    flash[:notice] = "Successfully destroyed school division."
    redirect_to school_divisions_url
  end
end
