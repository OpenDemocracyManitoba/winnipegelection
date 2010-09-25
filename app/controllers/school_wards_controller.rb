class SchoolWardsController < ApplicationController
  def index
    @school_wards = SchoolWard.all
  end
  
  def show
    @school_ward = SchoolWard.find(params[:id])
  end
  
  def new
    @school_ward = SchoolWard.new
    @school_divisions = SchoolDivision.all
  end
  
  def create
    @school_ward = SchoolWard.new(params[:school_ward])
    if @school_ward.save
      flash[:notice] = "Successfully created school ward."
      redirect_to @school_ward
    else
      render :action => 'new'
    end
  end
  
  def edit
    @school_ward = SchoolWard.find(params[:id])
    @school_divisions = SchoolDivision.all
  end
  
  def update
    @school_ward = SchoolWard.find(params[:id])
    if @school_ward.update_attributes(params[:school_ward])
      flash[:notice] = "Successfully updated school ward."
      redirect_to @school_ward
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @school_ward = SchoolWard.find(params[:id])
    @school_ward.destroy
    flash[:notice] = "Successfully destroyed school ward."
    redirect_to school_wards_url
  end
end
