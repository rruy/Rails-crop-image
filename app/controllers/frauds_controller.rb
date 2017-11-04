class FraudsController < ApplicationController
  
  def index 
      @frauds = Fraud.all
  end
  
  def new
      @fraud = Fraud.new
  end
  
  def show
     @fraud = Fraud.find(params[:id])
  end
  
  def create
     @fraud = Fraud.new fraud_params
     if @fraud.save!
        if params[:fraud][:avatar].blank?
          flash[:notice] = "Successfully created fraud."
          redirect_to @fraud
        else
          render :action => "crop"
        end
     else
        render :action => 'new'
     end 
  end
  
  def edit
    @fraud = Fraud.find(params[:id])
  end
  
  def update
    @fraud = Fraud.find(params[:id])
    
      if @fraud.update_attributes(fraud_params)
        if params[:fraud][:avatar].blank?
          flash[:notice] = "Successfully updated user."
          redirect_to @fraud
        else
          render :action => "crop"
        end
      else
        render :action => 'edit'
      end
  end
  
  private
  
  def fraud_params
      params.require(:fraud).permit(:title, :avatar, :crop_x, :crop_y, :crop_w, :crop_h, images_attributes: [:fraud_id, :image])
  end
  
end