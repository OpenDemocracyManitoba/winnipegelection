class WardsController < ApplicationController
  before_filter :authenticate
  
  def index
    @wards = Ward.all
  end
  
  def show
    @ward = Ward.find(params[:id])
  end
  
  def new
    @ward = Ward.new
  end
  
  def create
    @ward = Ward.new(params[:ward])
    if @ward.save
      flash[:notice] = "Successfully created ward."
      redirect_to :wards
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ward = Ward.find(params[:id])
  end
  
  def update
    @ward = Ward.find(params[:id])
    if @ward.update_attributes(params[:ward])
      flash[:notice] = "Successfully updated ward."
      redirect_to @ward
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ward = Ward.find(params[:id])
    @ward.destroy
    flash[:notice] = "Successfully destroyed ward."
    redirect_to wards_url
  end
  
end
