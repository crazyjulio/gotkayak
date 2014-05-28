class AdminController < ApplicationController
  before_filter :authenticate_dadmin!

  def index
    @dadmin = current_dadmin #Dadmin.find(current_dadmin.id)
  end

  def update_admin_profile
    @dadmin = current_dadmin #Dadmin.find(current_dadmin.id)

    respond_to do |format|
      if !params[:dadmin][:email].nil? || @dadmin.is_valid_password?(params[:dadmin][:current_password])
        params[:dadmin].delete(:current_password)
        if @dadmin.update_attributes(params[:dadmin])
          flash[:notice] = 'Profile was successfully updated.'
          format.html {redirect_to :action => :index}
          format.xml { head :ok }
        else
          format.html { render :action => "index" }
          format.xml { render :xml => @dadmin.errors, :status => :unprocessable_entity }
        end
      else
        @dadmin.errors.add(:current_password, "is invalid.")
        format.html { render :action => "index" }
        format.xml { render :xml => @dadmin.errors, :status => :unprocessable_entity }
      end
    end
  end
end
